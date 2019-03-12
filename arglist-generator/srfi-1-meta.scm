(srfi
  (number 1)
  (status final)
  (categories "data-structure")
  (title "List Library")
  (authors "Olin Shivers")
  (date-of-first-draft 1999 3 9)
  (date-finalized 1999 10 9)
  (revisions
    (revision
      (date 1998 11 8)
      (text "Received")
      (status not-officially-tracked))
    (revision
      (date 1999 3 9)
      (text "Draft")
      (status draft))
    (revision
      (date 1999 10 9)
      (text "Final")
      (status final))
    (revision
      (date 2016 8 27)
      (text "Revised to fix errata")
      (status final))
    (revision
      (date 2016 8 27)
      (text "Clarify Booleans")
      (status final))
    (revision
      (date 2018 10 8)
      (text "Remove extra parenthesis")
      (status final)))
  (abstract
    "R5RS Scheme has an impoverished set of list-processing utilities\, which is a\
problem for authors of portable code.  This SRFI proposes a coherent and\
comprehensive set of list-processing procedures\; it is accompanied by a\
reference implementation of the spec. The reference implementation is portable\
efficient\
completely open\, public-domain source")
  (symbols
    (symbol
      (name "cons")
      (procedure
        (arg "a")
        (arg "d")
        (return "pair")))
    (symbol
      (name "list")
      (procedure
        (arg "object")
        (arg "..." rest)
        (return "list")))
    (symbol
      (name "xcons")
      (procedure
        (arg "d")
        (arg "a")
        (return "pair")))
    (symbol
      (name "cons*")
      (procedure
        (arg "elt1")
        (arg "elt2")
        (arg "..." rest)
        (return "object")))
    (symbol
      (name "make-list")
      (procedure
        (arg "n")
        (arg "fill" optional)
        (return "list")))
    (symbol
      (name "list-tabulate")
      (procedure
        (arg "n")
        (arg "init-proc")
        (return "list")))
    (symbol
      (name "list-copy")
      (procedure
        (arg "flist")
        (return "flist")))
    (symbol
      (name "circular-list")
      (procedure
        (arg "elt1")
        (arg "elt2")
        (arg "..." rest)
        (return "list")))
    (symbol
      (name "iota")
      (procedure
        (arg "count")
        (arg "start" optional)
        (arg "step" optional)
        (return "list")))
    (symbol
      (name "proper-list?")
      (procedure
        (arg "x")
        (return "boolean")))
    (symbol
      (name "circular-list?")
      (procedure
        (arg "x")
        (return "boolean")))
    (symbol
      (name "dotted-list?")
      (procedure
        (arg "x")
        (return "boolean")))
    (symbol
      (name "pair?")
      (procedure
        (arg "object")
        (return "boolean")))
    (symbol
      (name "null?")
      (procedure
        (arg "object")
        (return "boolean")))
    (symbol
      (name "null-list?")
      (procedure
        (arg "list")
        (return "boolean")))
    (symbol
      (name "not-pair?")
      (procedure
        (arg "x")
        (return "boolean")))
    (symbol
      (name "list=")
      (procedure
        (arg "elt=")
        (arg "list1")
        (arg "..." rest)
        (return "boolean")))
    (symbol
      (name "car")
      (procedure
        (arg "pair")
        (return "value")))
    (symbol
      (name "cdr")
      (procedure
        (arg "pair")
        (return "value")))
    (symbol
      (name "caar")
      (procedure
        (arg "pair")
        (return "value")))
    (symbol
      (name "cadr")
      (procedure
        (arg "pair")
        (return "value")))
    (symbol
      (name "cdddar")
      (procedure
        (arg "pair")
        (return "value")))
    (symbol
      (name "cddddr")
      (procedure
        (arg "pair")
        (return "value")))
    (symbol
      (name "list-ref")
      (procedure
        (arg "clist")
        (arg "i")
        (return "value")))
    (symbol
      (name "first")
      (procedure
        (arg "pair")
        (return "object")))
    (symbol
      (name "second")
      (procedure
        (arg "pair")
        (return "object")))
    (symbol
      (name "third")
      (procedure
        (arg "pair")
        (return "object")))
    (symbol
      (name "fourth")
      (procedure
        (arg "pair")
        (return "object")))
    (symbol
      (name "fifth")
      (procedure
        (arg "pair")
        (return "object")))
    (symbol
      (name "sixth")
      (procedure
        (arg "pair")
        (return "object")))
    (symbol
      (name "seventh")
      (procedure
        (arg "pair")
        (return "object")))
    (symbol
      (name "eighth")
      (procedure
        (arg "pair")
        (return "object")))
    (symbol
      (name "ninth")
      (procedure
        (arg "pair")
        (return "object")))
    (symbol
      (name "tenth")
      (procedure
        (arg "pair")
        (return "object")))
    (symbol
      (name "car+cdr")
      (procedure
        (arg "pair")
        (return "x")
        (return "y")))
    (symbol
      (name "take")
      (procedure
        (arg "x")
        (arg "i")
        (return "list")))
    (symbol
      (name "drop")
      (procedure
        (arg "x")
        (arg "i")
        (return "object")))
    (symbol
      (name "take-right")
      (procedure
        (arg "flist")
        (arg "i")
        (return "object")))
    (symbol
      (name "drop-right")
      (procedure
        (arg "flist")
        (arg "i")
        (return "list")))
    (symbol
      (name "take\!")
      (procedure
        (arg "x")
        (arg "i")
        (return "list")))
    (symbol
      (name "drop-right\!")
      (procedure
        (arg "flist")
        (arg "i")
        (return "list")))
    (symbol
      (name "split-at")
      (procedure
        (arg "x")
        (arg "i")
        (return "list")
        (return "object")))
    (symbol
      (name "split-at\!")
      (procedure
        (arg "x")
        (arg "i")
        (return "list")
        (return "object")))
    (symbol
      (name "last")
      (procedure
        (arg "pair")
        (return "object")))
    (symbol
      (name "last-pair")
      (procedure
        (arg "pair")
        (return "pair")))
    (symbol
      (name "length")
      (procedure
        (arg "list")
        (return "integer")))
    (symbol
      (name "length+")
      (procedure
        (arg "clist")
        (return "integer")
        (arg "or")
        (arg "\#f")))
    (symbol
      (name "append")
      (procedure
        (arg "list1")
        (arg "..." rest)
        (return "list")))
    (symbol
      (name "append\!")
      (procedure
        (arg "list1")
        (arg "..." rest)
        (return "list")))
    (symbol
      (name "concatenate")
      (procedure
        (arg "list-of-lists")
        (return "value")))
    (symbol
      (name "concatenate\!")
      (procedure
        (arg "list-of-lists")
        (return "value")))
    (symbol
      (name "reverse")
      (procedure
        (arg "list")
        (return "list")))
    (symbol
      (name "reverse\!")
      (procedure
        (arg "list")
        (return "list")))
    (symbol
      (name "append-reverse")
      (procedure
        (arg "rev-head")
        (arg "tail")
        (return "list")))
    (symbol
      (name "append-reverse\!")
      (procedure
        (arg "rev-head")
        (arg "tail")
        (return "list")))
    (symbol
      (name "zip")
      (procedure
        (arg "clist1")
        (arg "clist2")
        (arg "..." rest)
        (return "list")))
    (symbol
      (name "unzip1")
      (procedure
        (arg "list")
        (return "list")))
    (symbol
      (name "unzip2")
      (procedure
        (arg "list")
        (return "list")
        (return "list")))
    (symbol
      (name "unzip3")
      (procedure
        (arg "list")
        (return "list")
        (return "list")
        (return "list")))
    (symbol
      (name "unzip4")
      (procedure
        (arg "list")
        (return "list")
        (return "list")
        (return "list")
        (return "list")))
    (symbol
      (name "unzip5")
      (procedure
        (arg "list")
        (return "list")
        (return "list")
        (return "list")
        (return "list")
        (return "list")))
    (symbol
      (name "count")
      (procedure
        (arg "pred")
        (arg "clist1")
        (arg "clist2")
        (return "integer")))
    (symbol
      (name "fold")
      (procedure
        (arg "kons")
        (arg "knil")
        (arg "clist1")
        (arg "clist2")
        (arg "..." rest)
        (return "value")))
    (symbol
      (name "fold-right")
      (procedure
        (arg "kons")
        (arg "knil")
        (arg "clist1")
        (arg "clist2")
        (arg "..." rest)
        (return "value")))
    (symbol
      (name "pair-fold")
      (procedure
        (arg "kons")
        (arg "knil")
        (arg "clist1")
        (arg "clist2")
        (arg "..." rest)
        (return "value")))
    (symbol
      (name "pair-fold-right")
      (procedure
        (arg "kons")
        (arg "knil")
        (arg "clist1")
        (arg "clist2")
        (arg "..." rest)
        (return "value")))
    (symbol
      (name "reduce")
      (procedure
        (arg "f")
        (arg "ridentity")
        (arg "list")
        (return "value")))
    (symbol
      (name "reduce-right")
      (procedure
        (arg "f")
        (arg "ridentity")
        (arg "list")
        (return "value")))
    (symbol
      (name "unfold")
      (procedure
        (arg "p")
        (arg "f")
        (arg "g")
        (arg "seed")
        (arg "tail-gen" optional)
        (return "list")))
    (symbol
      (name "unfold-right")
      (procedure
        (arg "p")
        (arg "f")
        (arg "g")
        (arg "seed")
        (arg "tail" optional)
        (return "list")))
    (symbol
      (name "map")
      (procedure
        (arg "proc")
        (arg "clist1")
        (arg "clist2")
        (arg "..." rest)
        (return "list")))
    (symbol
      (name "for-each")
      (procedure
        (arg "proc")
        (arg "clist1")
        (arg "clist2")
        (arg "..." rest)
        (return "unspecified")))
    (symbol
      (name "append-map")
      (procedure
        (arg "f")
        (arg "clist1")
        (arg "clist2")
        (arg "..." rest)
        (return "value")))
    (symbol
      (name "append-map\!")
      (procedure
        (arg "f")
        (arg "clist1")
        (arg "clist2")
        (arg "..." rest)
        (return "value")))
    (symbol
      (name "map\!")
      (procedure
        (arg "f")
        (arg "list1")
        (arg "clist2")
        (arg "..." rest)
        (return "list")))
    (symbol
      (name "map-in-order")
      (procedure
        (arg "f")
        (arg "clist1")
        (arg "clist2")
        (arg "..." rest)
        (return "list")))
    (symbol
      (name "pair-for-each")
      (procedure
        (arg "f")
        (arg "clist1")
        (arg "clist2")
        (arg "..." rest)
        (return "unspecific")))
    (symbol
      (name "filter-map")
      (procedure
        (arg "f")
        (arg "clist1")
        (arg "clist2")
        (arg "..." rest)
        (return "list")))
    (symbol
      (name "filter")
      (procedure
        (arg "pred")
        (arg "list")
        (return "list")))
    (symbol
      (name "partition")
      (procedure
        (arg "pred")
        (arg "list")
        (return "list")
        (return "list")))
    (symbol
      (name "remove")
      (procedure
        (arg "pred")
        (arg "list")
        (return "list")))
    (symbol
      (name "filter\!")
      (procedure
        (arg "pred")
        (arg "list")
        (return "list")))
    (symbol
      (name "partition\!")
      (procedure
        (arg "pred")
        (arg "list")
        (return "list")
        (return "list")))
    (symbol
      (name "remove\!")
      (procedure
        (arg "pred")
        (arg "list")
        (return "list")))
    (symbol
      (name "find")
      (procedure
        (arg "pred")
        (arg "clist")
        (return "value")))
    (symbol
      (name "find-tail")
      (procedure
        (arg "pred")
        (arg "clist")
        (return "pair")
        (arg "or")
        (arg "false")))
    (symbol
      (name "take-while")
      (procedure
        (arg "pred")
        (arg "clist")
        (return "list")))
    (symbol
      (name "take-while\!")
      (procedure
        (arg "pred")
        (arg "clist")
        (return "list")))
    (symbol
      (name "drop-while")
      (procedure
        (arg "pred")
        (arg "clist")
        (return "list")))
    (symbol
      (name "span")
      (procedure
        (arg "pred")
        (arg "clist")
        (return "list")
        (return "clist")))
    (symbol
      (name "span\!")
      (procedure
        (arg "pred")
        (arg "list")
        (return "list")
        (return "list")))
    (symbol
      (name "break")
      (procedure
        (arg "pred")
        (arg "clist")
        (return "list")
        (return "clist")))
    (symbol
      (name "break\!")
      (procedure
        (arg "pred")
        (arg "list")
        (return "list")
        (return "list")))
    (symbol
      (name "any")
      (procedure
        (arg "pred")
        (arg "clist1")
        (arg "clist2")
        (arg "..." rest)
        (return "value")))
    (symbol
      (name "every")
      (procedure
        (arg "pred")
        (arg "clist1")
        (arg "clist2")
        (arg "..." rest)
        (return "value")))
    (symbol
      (name "list-index")
      (procedure
        (arg "pred")
        (arg "clist1")
        (arg "clist2")
        (arg "..." rest)
        (return "integer")
        (arg "or")
        (arg "false")))
    (symbol
      (name "member")
      (procedure
        (arg "x")
        (arg "list")
        (arg "=" optional)
        (return "list")))
    (symbol
      (name "memq")
      (procedure
        (arg "x")
        (arg "list")
        (return "list")))
    (symbol
      (name "memv")
      (procedure
        (arg "x")
        (arg "list")
        (return "list")))
    (symbol
      (name "delete")
      (procedure
        (arg "x")
        (arg "list")
        (arg "=" optional)
        (return "list")))
    (symbol
      (name "delete\!")
      (procedure
        (arg "x")
        (arg "list")
        (arg "=" optional)
        (return "list")))
    (symbol
      (name "delete-duplicates")
      (procedure
        (arg "list")
        (arg "=" optional)
        (return "list")))
    (symbol
      (name "delete-duplicates\!")
      (procedure
        (arg "list")
        (arg "=" optional)
        (return "list")))
    (symbol
      (name "assoc")
      (procedure
        (arg "key")
        (arg "alist")
        (arg "=" optional)
        (return "pair")
        (arg "or")
        (arg "\#f")))
    (symbol
      (name "assq")
      (procedure
        (arg "key")
        (arg "alist")
        (return "pair")
        (arg "or")
        (arg "\#f")))
    (symbol
      (name "assv")
      (procedure
        (arg "key")
        (arg "alist")
        (return "pair")
        (arg "or")
        (arg "\#f")))
    (symbol
      (name "alist-cons")
      (procedure
        (arg "key")
        (arg "datum")
        (arg "alist")
        (return "alist")))
    (symbol
      (name "alist-copy")
      (procedure
        (arg "alist")
        (return "alist")))
    (symbol
      (name "alist-delete")
      (procedure
        (arg "key")
        (arg "alist")
        (arg "=" optional)
        (return "alist")))
    (symbol
      (name "alist-delete\!")
      (procedure
        (arg "key")
        (arg "alist")
        (arg "=" optional)
        (return "alist")))
    (symbol
      (name "lset\<=")
      (procedure
        (arg "=")
        (arg "list1")
        (arg "..." rest)
        (return "boolean")))
    (symbol
      (name "lset=")
      (procedure
        (arg "=")
        (arg "list1")
        (arg "list2")
        (arg "..." rest)
        (return "boolean")))
    (symbol
      (name "lset-adjoin")
      (procedure
        (arg "=")
        (arg "list")
        (arg "elt1")
        (arg "..." rest)
        (return "list")))
    (symbol
      (name "lset-union")
      (procedure
        (arg "=")
        (arg "list1")
        (arg "..." rest)
        (return "list")))
    (symbol
      (name "lset-intersection")
      (procedure
        (arg "=")
        (arg "list1")
        (arg "list2")
        (arg "..." rest)
        (return "list")))
    (symbol
      (name "lset-difference")
      (procedure
        (arg "=")
        (arg "list1")
        (arg "list2")
        (arg "..." rest)
        (return "list")))
    (symbol
      (name "lset-xor")
      (procedure
        (arg "=")
        (arg "list1")
        (arg "..." rest)
        (return "list")))
    (symbol
      (name "lset-diff+intersection")
      (procedure
        (arg "=")
        (arg "list1")
        (arg "list2")
        (arg "..." rest)
        (return "list")
        (return "list")))
    (symbol
      (name "lset-union\!")
      (procedure
        (arg "=")
        (arg "list1")
        (arg "..." rest)
        (return "list")))
    (symbol
      (name "lset-intersection\!")
      (procedure
        (arg "=")
        (arg "list1")
        (arg "list2")
        (arg "..." rest)
        (return "list")))
    (symbol
      (name "lset-difference\!")
      (procedure
        (arg "=")
        (arg "list1")
        (arg "list2")
        (arg "..." rest)
        (return "list")))
    (symbol
      (name "lset-xor\!")
      (procedure
        (arg "=")
        (arg "list1")
        (arg "..." rest)
        (return "list")))
    (symbol
      (name "lset-diff+intersection\!")
      (procedure
        (arg "=")
        (arg "list1")
        (arg "list2")
        (arg "..." rest)
        (return "list")
        (return "list")))
    (symbol
      (name "set-car\!")
      (procedure
        (arg "pair")
        (arg "object")
        (return "unspecified")))
    (symbol
      (name "set-cdr\!")
      (procedure
        (arg "pair")
        (arg "object")
        (return "unspecified")))))
