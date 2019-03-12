(srfi
  (number 133)
  (status final)
  (based-on-srfi 43)
  (categories data-structure)
  (title "Vector Library (R7RS-compatible)")
  (authors "John Cowan")
  (date-of-first-draft 2015 12 16)
  (date-finalized 2016 3 20)
  (revisions
    (revision
      (date 2015 12 15)
      (text "Received")
      (status not-officially-tracked))
    (revision
      (date 2016 2 14)
      (text "60-day deadline")
      (status not-officially-tracked))
    (revision
      (date 2015 12 16)
      (text "Draft #1 published")
      (status draft))
    (revision
      (date 2016 1 24)
      (text "Draft #2 published")
      (status draft))
    (revision
      (date 2016 1 31)
      (text "Draft #3 published")
      (status draft))
    (revision
      (date 2016 3 12)
      (text "Draft #4 published")
      (status draft))
    (revision
      (date 2016 3 20)
      (text "Finalized")
      (status final))
    (revision
      (date 2016 4 1)
      (text "Fixed description of vector-unfold!")
      (status final))
    (revision
      (date 2016 8 10)
      (text "Fixed typos")
      (status final))
    (revision
      (date 2016 9 2)
      (text "Changed order of arguments to vector-cumulate from vector-cumulate f vec knil to vector-cumulate f knil vec to match the argument order of vector-fold")
      (status final))
    (revision
      (date 2017 6 5)
      (text "Added second return type of vector-partition")
      (status final))
    (revision
      (date 2018 7 4)
      (text "Removed requirement that elt=? argument be consistent with eq?")
      (status final))
    (revision
      (date 2018 10 27)
      (text "Fixed typos")
      (status final)))
  (abstract
    "This SRFI proposes a comprehensive\
      library of vector operations accompanied by a freely\
      available and complete reference implementation.  The reference\
      implementation is unencumbered by copyright, and useable with no\
      modifications on any Scheme system that is\
      R5RS-compliant.  It also provides several\
      hooks for implementation-specific optimization as well.")
  (symbols
    (symbol
      (name "make-vector")
      (procedure
        (arg "size")
        (arg "fill" optional)
        (return "vector")))
    (symbol
      (name "vector")
      (procedure
        (arg "x")
        (arg "..." rest)
        (return "vector")))
    (symbol
      (name "vector-unfold")
      (procedure
        (arg "f")
        (arg "length")
        (arg "initial-seed")
        (arg "..." rest)
        (return "vector")))
    (symbol
      (name "vector-unfold-right")
      (procedure
        (arg "f")
        (arg "length")
        (arg "initial-seed")
        (arg "..." rest)
        (return "vector")))
    (symbol
      (name "vector-copy")
      (procedure
        (arg "vec")
        (arg "start" optional)
        (arg "end" optional)
        (return "vector")))
    (symbol
      (name "vector-reverse-copy")
      (procedure
        (arg "vec")
        (arg "start" optional)
        (arg "end" optional)
        (return "vector")))
    (symbol
      (name "vector-append")
      (procedure
        (arg "vec")
        (arg "..." rest)
        (return "vector")))
    (symbol
      (name "vector-concatenate")
      (procedure
        (arg "list-of-vectors")
        (return "vector")))
    (symbol
      (name "vector-append-subvectors")
      (procedure
        (arg "vec" optional)
        (arg "start" optional)
        (arg "end" optional)
        (arg "..." rest)
        (return "vector")))
    (symbol
      (name "vector?")
      (procedure
        (arg "x")
        (return "boolean")))
    (symbol
      (name "vector-empty?")
      (procedure
        (arg "vec")
        (return "boolean")))
    (symbol
      (name "vector=")
      (procedure
        (arg "elt=?")
        (arg "vec")
        (arg "..." rest)
        (return "boolean")))
    (symbol
      (name "vector-ref")
      (procedure
        (arg "vec")
        (arg "i")
        (return "value")))
    (symbol
      (name "vector-length")
      (procedure
        (arg "vec")
        (return "exact")
        (arg "nonnegative")
        (arg "integer")))
    (symbol
      (name "vector-fold")
      (procedure
        (arg "kons")
        (arg "knil")
        (arg "vec1")
        (arg "vec2")
        (arg "..." rest)
        (return "value")))
    (symbol
      (name "vector-fold-right")
      (procedure
        (arg "kons")
        (arg "knil")
        (arg "vec1")
        (arg "vec2")
        (arg "..." rest)
        (return "value")))
    (symbol
      (name "vector-map")
      (procedure
        (arg "f")
        (arg "vec1")
        (arg "vec2")
        (arg "..." rest)
        (return "vector")))
    (symbol
      (name "vector-map!")
      (procedure
        (arg "f")
        (arg "vec1")
        (arg "vec2")
        (arg "..." rest)
        (return "unspecified")))
    (symbol
      (name "vector-for-each")
      (procedure
        (arg "f")
        (arg "vec1")
        (arg "vec2")
        (arg "..." rest)
        (return "unspecified")))
    (symbol
      (name "vector-count")
      (procedure
        (arg "pred?")
        (arg "vec1")
        (arg "vec2")
        (arg "..." rest)
        (return "exact")
        (arg "nonnegative")
        (arg "integer")))
    (symbol
      (name "vector-cumulate")
      (procedure
        (arg "f")
        (arg "knil")
        (arg "vec")
        (return "vector")))
    (symbol
      (name "vector-index")
      (procedure
        (arg "pred?")
        (arg "vec1")
        (arg "vec2")
        (arg "..." rest)
        (return "exact")
        (arg "nonnegative")
        (arg "integer")
        (arg "or")
        (arg "#f")))
    (symbol
      (name "vector-index-right")
      (procedure
        (arg "pred?")
        (arg "vec1")
        (arg "vec2")
        (arg "..." rest)
        (return "exact")
        (arg "nonnegative")
        (arg "integer")
        (arg "or")
        (arg "#f")))
    (symbol
      (name "vector-skip")
      (procedure
        (arg "pred?")
        (arg "vec1")
        (arg "vec2")
        (arg "..." rest)
        (return "exact")
        (arg "nonnegative")
        (arg "integer")
        (arg "or")
        (arg "#f")))
    (symbol
      (name "vector-skip-right")
      (procedure
        (arg "pred?")
        (arg "vec1")
        (arg "vec2")
        (arg "..." rest)
        (return "exact")
        (arg "nonnegative")
        (arg "integer")
        (arg "or")
        (arg "#f")))
    (symbol
      (name "vector-binary-search")
      (procedure
        (arg "vec")
        (arg "value")
        (arg "cmp")
        (return "exact")
        (arg "nonnegative")
        (arg "integer")
        (arg "or")
        (arg "#f")))
    (symbol
      (name "vector-any")
      (procedure
        (arg "pred?")
        (arg "vec1")
        (arg "vec2")
        (arg "..." rest)
        (return "value")
        (arg "or")
        (arg "#f")))
    (symbol
      (name "vector-every")
      (procedure
        (arg "pred?")
        (arg "vec1")
        (arg "vec2")
        (arg "..." rest)
        (return "value")
        (arg "or")
        (arg "#f")))
    (symbol
      (name "vector-partition")
      (procedure
        (arg "pred?")
        (arg "vec")
        (return "vector")
        (arg "and")
        (arg "integer")))
    (symbol
      (name "vector-set!")
      (procedure
        (arg "vec")
        (arg "i")
        (arg "value")
        (return "unspecified")))
    (symbol
      (name "vector-swap!")
      (procedure
        (arg "vec")
        (arg "i")
        (arg "j")
        (return "unspecified")))
    (symbol
      (name "vector-fill!")
      (procedure
        (arg "vec")
        (arg "fill")
        (arg "start" optional)
        (arg "end" optional)
        (return "unspecified")))
    (symbol
      (name "vector-reverse!")
      (procedure
        (arg "vec")
        (arg "start" optional)
        (arg "end" optional)
        (return "unspecified")))
    (symbol
      (name "vector-copy!")
      (procedure
        (arg "to")
        (arg "at")
        (arg "from")
        (arg "start" optional)
        (arg "end" optional)
        (return "unspecified")))
    (symbol
      (name "vector-reverse-copy!")
      (procedure
        (arg "to")
        (arg "at")
        (arg "from")
        (arg "start" optional)
        (arg "end" optional)
        (return "unspecified")))
    (symbol
      (name "vector-unfold!")
      (procedure
        (arg "f")
        (arg "vec")
        (arg "start")
        (arg "end")
        (arg "initial-seed")
        (arg "..." rest)
        (return "unspecified")))
    (symbol
      (name "vector-unfold-right!")
      (procedure
        (arg "f")
        (arg "vec")
        (arg "start")
        (arg "end")
        (arg "initial-seed")
        (arg "..." rest)
        (return "unspecified")))
    (symbol
      (name "vector->list")
      (procedure
        (arg "vec")
        (arg "start" optional)
        (arg "end" optional)
        (return "proper-list")))
    (symbol
      (name "reverse-vector->list")
      (procedure
        (arg "vec")
        (arg "start" optional)
        (arg "end" optional)
        (return "proper-list")))
    (symbol
      (name "list->vector")
      (procedure
        (arg "proper-list")
        (return "vector")))
    (symbol
      (name "reverse-list->vector")
      (procedure
        (arg "proper-list")
        (return "vector")))
    (symbol
      (name "string->vector")
      (procedure
        (arg "string")
        (arg "start" optional)
        (arg "end" optional)
        (return "vector")))
    (symbol
      (name "vector->string")
      (procedure
        (arg "vec")
        (arg "start" optional)
        (arg "end" optional)
        (return "string")))))
