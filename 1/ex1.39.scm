(load "ex1.37.scm")

(define (tan-cf x k)
  (exact->inexact (cont-frac (lambda (i) (- (* 2 i) 1))
                             (lambda (i)
                               (if (= i 1)
                                   x
                                   (- (* x x))))
                             k)))
