#! /usr/bin/env python3

import glob
import os
import re

GLOB = os.path.join(
    os.path.dirname(__file__), "..", "..", "schemedoc", ".cache", "srfi-*.html"
)


def naturalkey(htmlfile):
    m = re.search(r"(\d+)\.html$", htmlfile)
    return None if not m else int(m.group(1))


for htmlfile in sorted(glob.glob(GLOB), key=naturalkey):
    print()
    OLDDATE = r"(((?:19|20)\d{2})/(\d{1,2})/(\d{1,2}))"
    for match in re.findall(OLDDATE, open(htmlfile).read()):
        olddate, y, m, d = match
        y, m, d = map(int, (y, m, d))
        newdate = "{:d}-{:02d}-{:02d}".format(y, m, d)
        print(olddate.ljust(10), " ", newdate, " ", os.path.basename(htmlfile))
