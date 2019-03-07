
(syntax define-syntax
  (arg keyword)
  (arg exp))

(syntax define-syntax
  (sublist
    (arg keyword)
    (quoted-symbol .)
    (arg formals))
  (arg exp1)
  (arg exp)
  (arg ... rest))

(syntax let-syntax
  (sublist
    (sublist
      (arg keyword)
      (arg exp))
    (arg ... rest))
  (arg exp*)
  (arg ... rest))

(syntax letrec-syntax
  (sublist
    (sublist
      (arg keyword)
      (arg exp))
    (arg ... rest))
  (arg exp*)
  (arg ... rest))

(procedure identifier?
  (arg obj))

(procedure bound-identifier=?
  (arg obj1)
  (arg obj2))

(procedure free-identifier=?
  (arg obj1)
  (arg obj2))

(procedure literal-identifier=?
  (arg obj1)
  (arg obj2))

(syntax syntax
  (arg datum))

(syntax quasisyntax
  (arg template))

(procedure datum->syntax-object
  (arg template-identifier)
  (arg obj))

(procedure syntax-object->datum
  (arg syntax-object))

(procedure make-capturing-identifier
  (arg template-identifier)
  (arg symbol))

(syntax begin-for-syntax
  (arg form)
  (arg ... rest))

(syntax around-syntax
  (arg before-exp)
  (arg form)
  (arg after-exp))

(procedure syntax-error
  (arg obj)
  (arg ... rest))

(syntax syntax-case
  (arg exp)
  (sublist
    (arg literal)
    (arg ... rest))
  (arg clause)
  (arg ... rest))

(syntax with-syntax
  (arg template))

(syntax syntax-rules
  (arg template))
