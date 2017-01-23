(load "ex1.24.scm")

(define (full-prime? n)
  (define (iter n i)
    (or (= n i)
        (and (prime-test? n i)
             (iter n (+ i 1)))))
  (and (>= n 2) (iter n 2)))
