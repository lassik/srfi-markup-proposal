#! /usr/bin/env python3

import argparse
import io
import re
import string
import sys
from collections import namedtuple

from bs4 import BeautifulSoup


ELLIPSIS = "..."

OptionalList = namedtuple("OptionalList", "list_")


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
    raise ValueError("Syntax error in sexp")


def printarglist(args, indent, extra):
    for i, arg in enumerate(args):
        if isinstance(arg, OptionalList):
            printarglist(arg.list_, indent, " optional")
        elif arg == "->":
            pass
        else:
            which = "arg"
            if i - 1 >= 0 and args[i - 1] == "->":
                which = "return"
            argextra = extra
            if arg.endswith(ELLIPSIS):
                argextra += " rest"
            print()
            print(indent + "({} {}{})".format(which, arg, argextra), end="")


def print_proc_def(sexp):
    assert isinstance(sexp, list)
    assert len(sexp)
    assert isinstance(sexp[0], str)
    name = sexp[0]
    args = sexp[1:]
    print()
    print("(procedure {}".format(name), end="")
    printarglist(args, "  ", "")
    print(")")


def print_syntax_def(sexp):
    assert isinstance(sexp, list)
    assert len(sexp)
    assert isinstance(sexp[0], str)


def cleanup(deftext):
    deftext = deftext.strip()
    deftext = deftext.lower()
    deftext = re.sub(r"\s+", " ", deftext)
    if not deftext.startswith("(") and not deftext.endswith(")"):
        deftext = "(" + deftext + ")"
    return deftext


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--raw", action="store_true", default=False)
    args = ap.parse_args()
    soup = BeautifulSoup(sys.stdin.read(), "html.parser")
    for def_ in soup.select(".def"):
        deftext = cleanup(def_.text)
        if args.raw:
            print(deftext)
        elif "proc" in def_["class"]:
            print_proc_def(read_sexp(Reader(deftext)))
        elif "syntax" in def_["class"]:
            print_syntax_def(read_sexp(Reader(deftext)))
