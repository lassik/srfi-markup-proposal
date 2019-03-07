
(procedure cons
  (arg a)
  (arg d)
  (return pair))

(procedure list
  (arg object)
  (arg ... rest)
  (return list))

(procedure xcons
  (arg d)
  (arg a)
  (return pair))

(procedure cons*
  (arg elt1)
  (arg elt2)
  (arg ... rest)
  (return object))

(procedure make-list
  (arg n)
  (arg fill optional)
  (return list))

(procedure list-tabulate
  (arg n)
  (arg init-proc)
  (return list))

(procedure list-copy
  (arg flist)
  (return flist))

(procedure circular-list
  (arg elt1)
  (arg elt2)
  (arg ... rest)
  (return list))

(procedure iota
  (arg count)
  (arg start optional)
  (arg step optional)
  (return list))

(procedure proper-list?
  (arg x)
  (return boolean))

(procedure circular-list?
  (arg x)
  (return boolean))

(procedure dotted-list?
  (arg x)
  (return boolean))

(procedure pair?
  (arg object)
  (return boolean))

(procedure null?
  (arg object)
  (return boolean))

(procedure null-list?
  (arg list)
  (return boolean))

(procedure not-pair?
  (arg x)
  (return boolean))

(procedure list=
  (arg elt=)
  (arg list1)
  (arg ... rest)
  (return boolean))

(procedure car
  (arg pair)
  (return value))

(procedure cdr
  (arg pair)
  (return value))

(procedure caar
  (arg pair)
  (return value))

(procedure cadr
  (arg pair)
  (return value))

(procedure cdddar
  (arg pair)
  (return value))

(procedure cddddr
  (arg pair)
  (return value))

(procedure list-ref
  (arg clist)
  (arg i)
  (return value))

(procedure first
  (arg pair)
  (return object))

(procedure second
  (arg pair)
  (return object))

(procedure third
  (arg pair)
  (return object))

(procedure fourth
  (arg pair)
  (return object))

(procedure fifth
  (arg pair)
  (return object))

(procedure sixth
  (arg pair)
  (return object))

(procedure seventh
  (arg pair)
  (return object))

(procedure eighth
  (arg pair)
  (return object))

(procedure ninth
  (arg pair)
  (return object))

(procedure tenth
  (arg pair)
  (return object))

(procedure car+cdr
  (arg pair)
  (return x)
  (return y))

(procedure take
  (arg x)
  (arg i)
  (return list))

(procedure drop
  (arg x)
  (arg i)
  (return object))

(procedure take-right
  (arg flist)
  (arg i)
  (return object))

(procedure drop-right
  (arg flist)
  (arg i)
  (return list))

(procedure take!
  (arg x)
  (arg i)
  (return list))

(procedure drop-right!
  (arg flist)
  (arg i)
  (return list))

(procedure split-at
  (arg x)
  (arg i)
  (return list)
  (return object))

(procedure split-at!
  (arg x)
  (arg i)
  (return list)
  (return object))

(procedure last
  (arg pair)
  (return object))

(procedure last-pair
  (arg pair)
  (return pair))

(procedure length
  (arg list)
  (return integer))

(procedure length+
  (arg clist)
  (return integer)
  (arg or)
  (arg #f))

(procedure append
  (arg list1)
  (arg ... rest)
  (return list))

(procedure append!
  (arg list1)
  (arg ... rest)
  (return list))

(procedure concatenate
  (arg list-of-lists)
  (return value))

(procedure concatenate!
  (arg list-of-lists)
  (return value))

(procedure reverse
  (arg list)
  (return list))

(procedure reverse!
  (arg list)
  (return list))

(procedure append-reverse
  (arg rev-head)
  (arg tail)
  (return list))

(procedure append-reverse!
  (arg rev-head)
  (arg tail)
  (return list))

(procedure zip
  (arg clist1)
  (arg clist2)
  (arg ... rest)
  (return list))

(procedure unzip1
  (arg list)
  (return list))

(procedure unzip2
  (arg list)
  (return list)
  (return list))

(procedure unzip3
  (arg list)
  (return list)
  (return list)
  (return list))

(procedure unzip4
  (arg list)
  (return list)
  (return list)
  (return list)
  (return list))

(procedure unzip5
  (arg list)
  (return list)
  (return list)
  (return list)
  (return list)
  (return list))

(procedure count
  (arg pred)
  (arg clist1)
  (arg clist2)
  (return integer))

(procedure fold
  (arg kons)
  (arg knil)
  (arg clist1)
  (arg clist2)
  (arg ... rest)
  (return value))

(procedure fold-right
  (arg kons)
  (arg knil)
  (arg clist1)
  (arg clist2)
  (arg ... rest)
  (return value))

(procedure pair-fold
  (arg kons)
  (arg knil)
  (arg clist1)
  (arg clist2)
  (arg ... rest)
  (return value))

(procedure pair-fold-right
  (arg kons)
  (arg knil)
  (arg clist1)
  (arg clist2)
  (arg ... rest)
  (return value))

(procedure reduce
  (arg f)
  (arg ridentity)
  (arg list)
  (return value))

(procedure reduce-right
  (arg f)
  (arg ridentity)
  (arg list)
  (return value))

(procedure unfold
  (arg p)
  (arg f)
  (arg g)
  (arg seed)
  (arg tail-gen optional)
  (return list))

(procedure unfold-right
  (arg p)
  (arg f)
  (arg g)
  (arg seed)
  (arg tail optional)
  (return list))

(procedure map
  (arg proc)
  (arg clist1)
  (arg clist2)
  (arg ... rest)
  (return list))

(procedure for-each
  (arg proc)
  (arg clist1)
  (arg clist2)
  (arg ... rest)
  (return unspecified))

(procedure append-map
  (arg f)
  (arg clist1)
  (arg clist2)
  (arg ... rest)
  (return value))

(procedure append-map!
  (arg f)
  (arg clist1)
  (arg clist2)
  (arg ... rest)
  (return value))

(procedure map!
  (arg f)
  (arg list1)
  (arg clist2)
  (arg ... rest)
  (return list))

(procedure map-in-order
  (arg f)
  (arg clist1)
  (arg clist2)
  (arg ... rest)
  (return list))

(procedure pair-for-each
  (arg f)
  (arg clist1)
  (arg clist2)
  (arg ... rest)
  (return unspecific))

(procedure filter-map
  (arg f)
  (arg clist1)
  (arg clist2)
  (arg ... rest)
  (return list))

(procedure filter
  (arg pred)
  (arg list)
  (return list))

(procedure partition
  (arg pred)
  (arg list)
  (return list)
  (return list))

(procedure remove
  (arg pred)
  (arg list)
  (return list))

(procedure filter!
  (arg pred)
  (arg list)
  (return list))

(procedure partition!
  (arg pred)
  (arg list)
  (return list)
  (return list))

(procedure remove!
  (arg pred)
  (arg list)
  (return list))

(procedure find
  (arg pred)
  (arg clist)
  (return value))

(procedure find-tail
  (arg pred)
  (arg clist)
  (return pair)
  (arg or)
  (arg false))

(procedure take-while
  (arg pred)
  (arg clist)
  (return list))

(procedure take-while!
  (arg pred)
  (arg clist)
  (return list))

(procedure drop-while
  (arg pred)
  (arg clist)
  (return list))

(procedure span
  (arg pred)
  (arg clist)
  (return list)
  (return clist))

(procedure span!
  (arg pred)
  (arg list)
  (return list)
  (return list))

(procedure break
  (arg pred)
  (arg clist)
  (return list)
  (return clist))

(procedure break!
  (arg pred)
  (arg list)
  (return list)
  (return list))

(procedure any
  (arg pred)
  (arg clist1)
  (arg clist2)
  (arg ... rest)
  (return value))

(procedure every
  (arg pred)
  (arg clist1)
  (arg clist2)
  (arg ... rest)
  (return value))

(procedure list-index
  (arg pred)
  (arg clist1)
  (arg clist2)
  (arg ... rest)
  (return integer)
  (arg or)
  (arg false))

(procedure member
  (arg x)
  (arg list)
  (arg = optional)
  (return list))

(procedure memq
  (arg x)
  (arg list)
  (return list))

(procedure memv
  (arg x)
  (arg list)
  (return list))

(procedure delete
  (arg x)
  (arg list)
  (arg = optional)
  (return list))

(procedure delete!
  (arg x)
  (arg list)
  (arg = optional)
  (return list))

(procedure delete-duplicates
  (arg list)
  (arg = optional)
  (return list))

(procedure delete-duplicates!
  (arg list)
  (arg = optional)
  (return list))

(procedure assoc
  (arg key)
  (arg alist)
  (arg = optional)
  (return pair)
  (arg or)
  (arg #f))

(procedure assq
  (arg key)
  (arg alist)
  (return pair)
  (arg or)
  (arg #f))

(procedure assv
  (arg key)
  (arg alist)
  (return pair)
  (arg or)
  (arg #f))

(procedure alist-cons
  (arg key)
  (arg datum)
  (arg alist)
  (return alist))

(procedure alist-copy
  (arg alist)
  (return alist))

(procedure alist-delete
  (arg key)
  (arg alist)
  (arg = optional)
  (return alist))

(procedure alist-delete!
  (arg key)
  (arg alist)
  (arg = optional)
  (return alist))

(procedure lset<=
  (arg =)
  (arg list1)
  (arg ... rest)
  (return boolean))

(procedure lset=
  (arg =)
  (arg list1)
  (arg list2)
  (arg ... rest)
  (return boolean))

(procedure lset-adjoin
  (arg =)
  (arg list)
  (arg elt1)
  (arg ... rest)
  (return list))

(procedure lset-union
  (arg =)
  (arg list1)
  (arg ... rest)
  (return list))

(procedure lset-intersection
  (arg =)
  (arg list1)
  (arg list2)
  (arg ... rest)
  (return list))

(procedure lset-difference
  (arg =)
  (arg list1)
  (arg list2)
  (arg ... rest)
  (return list))

(procedure lset-xor
  (arg =)
  (arg list1)
  (arg ... rest)
  (return list))

(procedure lset-diff+intersection
  (arg =)
  (arg list1)
  (arg list2)
  (arg ... rest)
  (return list)
  (return list))

(procedure lset-union!
  (arg =)
  (arg list1)
  (arg ... rest)
  (return list))

(procedure lset-intersection!
  (arg =)
  (arg list1)
  (arg list2)
  (arg ... rest)
  (return list))

(procedure lset-difference!
  (arg =)
  (arg list1)
  (arg list2)
  (arg ... rest)
  (return list))

(procedure lset-xor!
  (arg =)
  (arg list1)
  (arg ... rest)
  (return list))

(procedure lset-diff+intersection!
  (arg =)
  (arg list1)
  (arg list2)
  (arg ... rest)
  (return list)
  (return list))

(procedure set-car!
  (arg pair)
  (arg object)
  (return unspecified))

(procedure set-cdr!
  (arg pair)
  (arg object)
  (return unspecified))
