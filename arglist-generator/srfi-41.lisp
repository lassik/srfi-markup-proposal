
(variable stream-null)

(procedure stream-cons
  (arg object)
  (arg stream))

(procedure stream?
  (arg object))

(procedure stream-null?
  (arg object))

(procedure stream-pair?
  (arg object))

(procedure stream-car
  (arg stream))

(procedure stream-cdr
  (arg stream))

(procedure stream-lambda
  (arg args)
  (arg body))

(syntax define-stream
  (sublist
    (arg name)
    (arg args))
  (arg body))

(procedure list->stream
  (arg list-of-objects))

(procedure port->stream
  (arg port optional))

(syntax stream
  (arg object)
  (arg ... rest))

(procedure stream->list
  (arg n optional)
  (arg stream))

(procedure stream-append
  (arg stream)
  (arg ... rest))

(procedure stream-concat
  (arg stream))

(procedure stream-constant
  (arg object)
  (arg ... rest))

(procedure stream-drop
  (arg n)
  (arg stream))

(procedure stream-drop-while
  (arg pred?)
  (arg stream))

(procedure stream-filter
  (arg pred?)
  (arg stream))

(procedure stream-fold
  (arg proc)
  (arg base)
  (arg stream))

(procedure stream-for-each
  (arg proc)
  (arg stream)
  (arg ... rest))

(procedure stream-from
  (arg first)
  (arg step optional))

(procedure stream-iterate
  (arg proc)
  (arg base))

(procedure stream-length
  (arg stream))

(syntax stream-let
  (arg tag)
  (sublist
    (sublist
      (arg var)
      (arg expr))
    (arg ... rest))
  (arg body))

(procedure stream-map
  (arg proc)
  (arg stream)
  (arg ... rest))

(procedure stream-match
  (arg stream)
  (arg clause)
  (arg ... rest))

(procedure stream-of
  (arg expr)
  (arg clause)
  (arg ... rest))

(procedure stream-range
  (arg first)
  (arg past)
  (arg step optional))

(procedure stream-ref
  (arg stream)
  (arg n))

(procedure stream-reverse
  (arg stream))

(procedure stream-scan
  (arg proc)
  (arg base)
  (arg stream))

(procedure stream-take
  (arg n)
  (arg stream))

(procedure stream-take-while
  (arg pred?)
  (arg stream))

(procedure stream-unfold
  (arg map)
  (arg pred?)
  (arg gen)
  (arg base))

(procedure stream-unfolds
  (arg proc)
  (arg seed))

(procedure stream-zip
  (arg stream)
  (arg ... rest))
