#! /usr/bin/env python3

from collections import defaultdict
import argparse
import re

from bs4 import BeautifulSoup  # pip3 install beautifulsoup4


def getauthors(soup):
    authors = set()
    for autag in soup.select(".authors"):
        autext = autag.text
        autext = re.sub(r"\s+\(.*?\)$", "", autext)
        autext = autext.replace(", by ", "")
        for au in re.split(r", and |, | and ", autext):
            authors.add(au)
    return list(sorted(authors))


if __name__ == "__main__":
    soup = BeautifulSoup(open("index.html").read(), "html.parser")
    for author in getauthors(soup):
        print(author)
