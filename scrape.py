#! /usr/bin/env python3

from collections import defaultdict
import argparse
import re

from bs4 import BeautifulSoup  # pip3 install beautifulsoup4


class Arg:
    def __init__(self, name, opt, rest):
        self.name = name
        self.opt = opt
        self.rest = rest


class Proc:
    def __init__(self):
        self.name = ""
        self.blurb = ""
        self.args = []
        self.ret = []


def cleanup(s):
    return re.sub(r"\s+", " ", s).strip().capitalize()


def getname(tag):
    name = next(iter(tag.select(".name")), None)
    name = name.text.strip() if name else None
    return name or None


def getblurb(tag):
    return cleanup(" ".join([blurb.text for blurb in tag.select(".blurb")]))


def getargs(tag):
    return [
        Arg(
            name=arg.text.strip(),
            opt=("opt" in arg["class"]),
            rest=("rest" in arg["class"]),
        )
        for arg in tag.select(".arg")
    ]


def getret(tag):
    return list(filter(None, (ret.text.strip() for ret in tag.select(".ret"))))


def getprocs(htmlfile):
    procs = defaultdict(Proc)
    soup = BeautifulSoup(open(htmlfile).read(), "html.parser")
    for defproc in soup.select(".proc.def"):
        name = getname(defproc)
        if not name:
            continue
        procs[name].name = name
        blurb = getblurb(defproc)
        if blurb:
            procs[name].blurb = blurb
        args = getargs(defproc)
        if args:
            procs[name].args.extend(args)
        ret = getret(defproc)
        if ret:
            procs[name].ret.extend(ret)
    return list(sorted(procs.values(), key=lambda proc: proc.name))


def argrepr(arg):
    paren = " (rest)" if arg.rest else " (optional)" if arg.opt else ""
    return arg.name + paren


def printprocs(procs):
    print()
    for proc in procs:
        print("Procedure", proc.name)
        if proc.blurb:
            print("Blurb:", proc.blurb)
        for arg in proc.args:
            print("Argument:", argrepr(arg))
        for ret in proc.ret:
            print("Returns: " + ret)
        print()


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("htmlfiles", metavar="html-file", nargs="+")
    args = ap.parse_args()
    for htmlfile in args.htmlfiles:
        printprocs(getprocs(htmlfile))
        print("-"*70)
