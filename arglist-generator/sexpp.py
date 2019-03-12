import string


class LineBreakClass:
    pass


LineBreak = LineBreakClass()


class Symbol:
    def __init__(self, name):
        self.name = name


def dumps_str(s):
    ans = '"'
    for ch in s:
        if not (ch in string.ascii_letters or ch in string.digits or ch in " +-./*=?'"):
            ans += "\\"
        ans += ch
    ans += '"'
    return ans


def dumps_list(list_, listindent):
    ans = "("
    itemindent = listindent + (" " * 2)
    anylinebreaks = False
    nextbreak = ""
    for i, item in enumerate(list_):
        if isinstance(item, LineBreakClass):
            anylinebreaks = True
            nextbreak = "\n" + itemindent
            continue
        ans += nextbreak + dumps(item, itemindent)
        nextbreak = " "
    ans += ")"
    return ans


def dumps(obj, indent=""):
    if isinstance(obj, Symbol):
        return obj.name
    if isinstance(obj, int):
        return str(obj)
    if isinstance(obj, str):
        return dumps_str(obj)
    if isinstance(obj, list):
        return dumps_list(obj, indent)
    raise ValueError("Cannot sexp-dump {}-type object {}".format(type(obj), repr(obj)))
