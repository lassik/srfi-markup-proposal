#! /usr/bin/env python3

import argparse
import io
import os
import re
import string
import sys
from collections import defaultdict, namedtuple
from contextlib import contextmanager
from itertools import chain

import sexpp
from sexpp import Symbol, LineBreak
from bs4 import BeautifulSoup

ELLIPSIS = "..."

RawDefs = namedtuple("RawDefs", "defs general")
OptionalList = namedtuple("OptionalList", "list_")


@contextmanager
def supersede(filename):
    newfile = filename + ".new"
    with open(newfile, "w") as out:
        yield out
    os.rename(newfile, filename)


class Reader:
    def __init__(self, s):
        self.s = s
        self.i = 0

    def match_char(self, k, ch):
        if k == True:
            return True
        if isinstance(k, str):
            return k == ch
        if callable(k):
            return k(ch)
        return False

    def read_char_if(self, k):
        if self.i >= len(self.s):
            return None
        ch = self.s[self.i]
        if not self.match_char(k, ch):
            return None
        self.i += 1
        return ch

    def read_while(self, k):
        ans = ""
        while True:
            ch = self.read_char_if(k)
            if not ch:
                break
            ans += ch
        return ans if len(ans) > 0 else None

    def skip_space(self):
        self.read_while(str.isspace)


def is_symbol_char(ch):
    return ch in string.ascii_letters or ch in string.digits or ch in "<>=/*+-?!.#"


def read_symbol(rd):
    return rd.read_while(is_symbol_char)


def read_list(rd, opening, closing, constructor):
    if not rd.read_char_if(opening):
        return None
    list_ = []
    rd.skip_space()
    while not rd.read_char_if(closing):
        list_.append(read_sexp(rd))
    return constructor(list_)


def read_sexp(rd):
    rd.skip_space()
    obj = read_list(rd, "(", ")", list)
    if obj is not None:
        return obj
    obj = read_list(rd, "[", "]", OptionalList)
    if obj is not None:
        return obj
    obj = read_symbol(rd)
    if obj is not None:
        return obj
    raise ValueError(
        "Syntax error in sexp (char {})".format(repr(rd.read_char_if(True)))
    )


def dump_arg_list(args, flags):
    last_arrow = None
    full_list = []
    for i, arg in enumerate(args):
        if arg == "->":
            last_arrow = i
        elif isinstance(arg, list):
            assert "syntax" in flags
            full_list.append(LineBreak)
            full_list.append(
                [Symbol("sublist")]
                + dump_arg_list(
                    arg, flags | (set(["return"]) if last_arrow == i - 1 else set())
                )
            )
        elif isinstance(arg, OptionalList):
            full_list.extend(
                dump_arg_list(
                    arg.list_,
                    flags
                    | set(["optional"])
                    | (set(["return"]) if last_arrow == i - 1 else set()),
                )
            )
        else:
            if not isinstance(arg, str):
                raise ValueError(
                    "Expected symbol in arglist but got {}".format(repr(arg))
                )
            argflags = set(flags) - set(["syntax"])
            which = "arg"
            if ("return" in argflags) or last_arrow == i - 1:
                which = "return"
            if arg.endswith(ELLIPSIS):
                argflags.add("rest")
                argflags.discard("optional")
            elif arg.startswith("<") and arg.endswith(">") and len(arg) > 2:
                arg = arg[1 : len(arg) - 1]
                if "syntax" in flags:
                    which = "arg"
            elif "syntax" in flags:
                which = "quoted-symbol"
            if which == "return":
                argflags = argflags - set(["optional", "return"])
            full_list.append(LineBreak)
            full_list.append([Symbol(which), arg] + list(map(Symbol, sorted(argflags))))
    return full_list


def dump_proc_def(sexp):
    assert isinstance(sexp, list)
    assert len(sexp)
    assert isinstance(sexp[0], str)
    name = sexp[0]
    args = sexp[1:]
    return [
        Symbol("symbol"),
        LineBreak,
        [Symbol("name"), name],
        LineBreak,
        [Symbol("procedure")] + dump_arg_list(args, set()),
    ]


def dump_syntax_def(sexp):
    assert isinstance(sexp, list)
    assert len(sexp)
    assert isinstance(sexp[0], str)
    name = sexp[0]
    args = sexp[1:]
    return [Symbol("syntax"), dump_arg_list(args, set(["syntax"]))]


def dump_variable_def(sexp):
    assert isinstance(sexp, str)
    return [Symbol("variable"), sexp]


def cleanup(deftext):
    deftext = deftext.strip()
    deftext = deftext.lower()
    deftext = re.sub(r"\s+", " ", deftext)
    return deftext


def ensure_parens(s):
    has_opening = s.startswith("(")
    has_closing = s.endswith(")")
    if has_opening != has_closing:
        raise ValueError("ensure_parens: unexpected: {}".format(s))
    if not has_opening:
        s = "(" + s + ")"
    return s


def get_raw_defs_xhtml(soup):
    return [
        ("proc", ensure_parens(cleanup(def_.text)))
        for def_ in soup.select("dt")
        if "->" in def_.text
    ]


def get_srfi_number_from_filename(html_file):
    match = re.match(r"srfi-(\d+).html$", html_file)
    assert match
    return int(match.group(1))


def get_srfi_title(soup):
    title = soup.find("title").text.strip()
    match = re.match(r"SRFI[ -]\d+: (.*)", title)
    return match.group(1) if match else title


def parse_srfi_date_into_list(date):
    # Last match -- in case it's a date range, pick the end date.
    match = re.search(r".*(\d{4})/(\d{1,2})/(\d{1,2})$", date)
    assert match
    y, m, d = map(int, (match.group(1), match.group(2), match.group(3)))
    return [y, m, d]


def infer_srfi_status(rev_text, previous_status):
    rev_text = rev_text.lower()
    if "withdraw" in rev_text:
        return "withdrawn"
    if "final" in rev_text:
        return "final"
    if previous_status in ("final", "withdrawn", "draft"):
        return previous_status
    if "draft" in rev_text:
        return "draft"
    return "not-officially-tracked"


def get_raw_defs_classes(soup):
    rawdefs = []
    for def_ in soup.select(".def"):
        classes = set(def_["class"])
        text = cleanup(def_.text)
        if "proc" in classes or "syntax" in classes:
            text = ensure_parens(text)
        rawdefs.append((classes, text))
    general = {
        "abstract": "",
        "status": "",
        "authors": [],
        "revisions": [],
        "date-of-first-draft": [],
        "date-finalized": [],
    }
    general["title"] = get_srfi_title(soup)
    for x in soup.select(".srfi-abstract"):
        general["abstract"] = " ".join([general["abstract"], x.text.strip()]).strip()
    for x in soup.select(".srfi-status"):
        general["status"] = x.text
    for x in soup.select(".srfi-author"):
        general["authors"].append(x.text)
    last_status = None
    for x in soup.select(".srfi-revision"):
        date = x.select("time")[0].text
        text = x.text.replace(date, "")
        text = re.sub(r"[():.]", "", text).strip()
        date = parse_srfi_date_into_list(date)
        status = infer_srfi_status(text, last_status)
        if last_status != "draft" and status == "draft":
            general["date-of-first-draft"] = date
        elif last_status == "draft" and status == "final":
            general["date-finalized"] = date
        last_status = status
        general["revisions"].append((date, text, status))
    return RawDefs(defs=rawdefs, general=general)


def dump_def(def_):
    classes, text = def_
    if "proc" in classes:
        return dump_proc_def(read_sexp(Reader(text)))
    elif "syntax" in classes:
        return dump_syntax_def(read_sexp(Reader(text)))
    elif "variable" in classes:
        return dump_variable_def(text)
    else:
        raise ValueError("unknown def (classes: {})".format(repr(classes)))


def process_html_file(html_file, get_raw_defs):
    text_file = os.path.splitext(html_file)[0] + "-meta.text"
    lisp_file = os.path.splitext(html_file)[0] + "-meta.scm"
    lisp_add_file = os.path.splitext(html_file)[0] + "-meta-add.scm"
    additions = {}
    if os.path.isfile(lisp_add_file):
        additions = dict(read_sexp(Reader(open(lisp_add_file).read())))
    print(repr(additions))
    soup = BeautifulSoup(open(html_file).read(), "html.parser")
    rawdefs = get_raw_defs(soup)
    with supersede(text_file) as out:
        for _, text in rawdefs.defs:
            print(text, file=out)
    with supersede(lisp_file) as out:
        print(
            sexpp.dumps(
                [
                    Symbol("srfi"),
                    LineBreak,
                    [Symbol("number"), get_srfi_number_from_filename(html_file)],
                    LineBreak,
                    [Symbol("status"), Symbol(rawdefs.general["status"])],
                    LineBreak,
                    [Symbol("categories")] + list(additions.get("categories", [])),
                    LineBreak,
                    [Symbol("title"), rawdefs.general["title"]],
                    LineBreak,
                    [Symbol("authors")] + rawdefs.general["authors"],
                    LineBreak,
                    [Symbol("date-of-first-draft")]
                    + rawdefs.general["date-of-first-draft"],
                    LineBreak,
                    [Symbol("date-finalized")] + rawdefs.general["date-finalized"],
                    LineBreak,
                    [Symbol("revisions"), LineBreak]
                    + list(
                        chain.from_iterable(
                            [
                                [
                                    Symbol("revision"),
                                    LineBreak,
                                    [Symbol("date")] + rev_date,
                                    LineBreak,
                                    [Symbol("text"), rev_text],
                                    LineBreak,
                                    [Symbol("status"), Symbol(rev_status)],
                                ],
                                LineBreak,
                            ]
                            for rev_date, rev_text, rev_status in rawdefs.general[
                                "revisions"
                            ]
                        )
                    ),
                    LineBreak,
                    [Symbol("abstract"), LineBreak, rawdefs.general["abstract"]],
                    LineBreak,
                    [Symbol("symbols"), LineBreak]
                    + list(
                        chain.from_iterable(
                            [LineBreak, dump_def(x)] for x in rawdefs.defs
                        )
                    ),
                ]
            ),
            file=out,
        )


MARKUPS = {"classes": get_raw_defs_classes, "xhtml": get_raw_defs_xhtml}
DEFAULT_MARKUP = "classes"

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument(
        "--markup", default=DEFAULT_MARKUP, choices=list(sorted(MARKUPS.keys()))
    )
    ap.add_argument("html_files", metavar="html-file", nargs="+")
    args = ap.parse_args()
    get_raw_defs = MARKUPS[args.markup]
    for html_file in args.html_files:
        print(html_file, file=sys.stderr)
        process_html_file(html_file, get_raw_defs)
