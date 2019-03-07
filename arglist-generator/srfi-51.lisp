
(procedure rest-values
  (arg caller optional)
  (arg rest-list)
  (arg args-number-limit optional)
  (arg default optional)
  (arg ... rest))

(syntax arg-and
  (arg caller optional)
  (arg variable)
  (arg expr)
  (arg ... rest))

(syntax arg-ands
  (quoted-symbol common optional)
  (arg caller optional)
  (sublist
    (arg caller optional)
    (arg variable)
    (arg expr)
    (arg ... rest))
  (arg ... rest))

(syntax err-and
  (arg caller)
  (arg expression)
  (arg ... rest))

(syntax err-ands
  (sublist
    (arg caller)
    (arg expression)
    (arg ... rest))
  (arg ... rest))

(syntax arg-or
  (arg caller optional)
  (arg variable)
  (arg expr)
  (arg ... rest))

(syntax arg-ors
  (quoted-symbol common optional)
  (arg caller optional)
  (sublist
    (arg caller optional)
    (arg variable)
    (arg expr)
    (arg ... rest))
  (arg ... rest))

(syntax err-or
  (arg caller)
  (arg expression)
  (arg ... rest))

(syntax err-ors
  (sublist
    (arg caller)
    (arg expression)
    (arg ... rest))
  (arg ... rest))
