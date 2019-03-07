#! /usr/bin/env python3

import argparse
import io
import os
import re
import string
import sys
from collections import namedtuple
from contextlib import contextmanager

from bs4 import BeautifulSoup


ELLIPSIS = "..."

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


def printarglist(out, args, indent, flags):
    last_arrow = None
    for i, arg in enumerate(args):
        if arg == "->":
            last_arrow = i
        elif isinstance(arg, list):
            assert "syntax" in flags
            print(file=out)
            print(indent + "(sublist", end="", file=out)
            printarglist(
                out,
                arg,
                indent + "  ",
                flags | (set(["return"]) if last_arrow == i - 1 else set()),
            )
            print(")", end="", file=out)
        elif isinstance(arg, OptionalList):
            printarglist(
                out,
                arg.list_,
                indent,
                flags
                | set(["optional"])
                | (set(["return"]) if last_arrow == i - 1 else set()),
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
            elif "syntax" in flags:
                if arg.startswith("<") and arg.endswith(">") and len(arg) > 2:
                    which = "arg"
                    arg = arg[1 : len(arg) - 1]
                else:
                    which = "quoted-symbol"
            if which == "return":
                argflags = argflags - set(["optional", "return"])
            argflagsstr = " " + " ".join(sorted(argflags)) if argflags else ""
            print(file=out)
            print(
                indent + "({} {}{})".format(which, arg, argflagsstr), end="", file=out
            )


def print_proc_def(sexp, out):
    assert isinstance(sexp, list)
    assert len(sexp)
    assert isinstance(sexp[0], str)
    name = sexp[0]
    args = sexp[1:]
    print(file=out)
    print("(procedure {}".format(name), end="", file=out)
    printarglist(out, args, "  ", set())
    print(")", file=out)


def print_syntax_def(sexp, out):
    assert isinstance(sexp, list)
    assert len(sexp)
    assert isinstance(sexp[0], str)
    name = sexp[0]
    args = sexp[1:]
    print(file=out)
    print("(syntax {}".format(name), end="", file=out)
    printarglist(out, args, "  ", set(["syntax"]))
    print(")", file=out)


def print_variable_def(sexp, out):
    assert isinstance(sexp, str)
    print(file=out)
    print("(variable {})".format(sexp), file=out)


def cleanup(deftext):
    deftext = deftext.strip()
    deftext = deftext.lower()
    deftext = re.sub(r"\s+", " ", deftext)
    return deftext


def ensure_parens(s):
    if not (s.startswith("(") and s.endswith(")")):
        s = "(" + s + ")"
    return s


def process_html_file(html_file):
    text_file = os.path.splitext(html_file)[0] + ".text"
    lisp_file = os.path.splitext(html_file)[0] + ".lisp"
    rawdefs = []
    soup = BeautifulSoup(open(html_file).read(), "html.parser")
    for def_ in soup.select(".def"):
        classes = set(def_["class"])
        text = cleanup(def_.text)
        if "proc" in classes or "syntax" in classes:
            text = ensure_parens(text)
        rawdefs.append((classes, text))
    with supersede(text_file) as out:
        for _, text in rawdefs:
            print(text, file=out)
    with supersede(lisp_file) as out:
        for classes, text in rawdefs:
            if "proc" in classes:
                print_proc_def(read_sexp(Reader(text)), out)
            elif "syntax" in classes:
                print_syntax_def(read_sexp(Reader(text)), out)
            elif "variable" in classes:
                print_variable_def(text, out)
            else:
                raise ValueError("unknown def (classes: {})".format(repr(classes)))


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    # ap.add_argument("--raw", action="store_true", default=False)
    ap.add_argument("html_files", metavar="html-file", nargs="+")
    args = ap.parse_args()
    for html_file in args.html_files:
        print(html_file, file=sys.stderr)
        process_html_file(html_file)
