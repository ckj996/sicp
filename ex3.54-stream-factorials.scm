(load "stream-integers.scm")
(load "ex3.54-mul-streams.scm")

(define factorials (cons-stream 1 (mul-streams factorials integers)))
