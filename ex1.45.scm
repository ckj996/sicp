(load "ex1.40.scm")
(load "ex1.43.scm")

(define (average-damp-n-times n)
  (repeated average-damp n))

(define (n-root n)
  (define (log2 n)
    (/ (log n) (log 2)))
  (lambda (x)
    (fixed-point-of-transform (lambda (y) (/ x (expt y (- n 1))))
                              (average-damp-n-times (floor (log2 n)))
                              1.0)))
