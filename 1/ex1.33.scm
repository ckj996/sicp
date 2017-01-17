(define (filtered-accumulate filter? combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (if (filter? (term a))
            (iter (next a)
                  (combiner result
                            (term a)))
            (iter (next a) result))))
  (iter a null-value))

(load "ex1.28.scm")

(define (sum-prime a b)
  (define (next x) (+ x 1))
  (define (term x) x)
  (filtered-accumulate prime? + 0 term a next b))

(define (gcd x y)
  (if (= y 0)
      x
      (gcd y (remainder x y))))

(define (product-coprime n)
  (define (filter? x)
    (= (gcd x n) 1))
  (define (term x) x)
  (define (next x) (+ x 1))
  (filtered-accumulate filter? * 1 term 1 next (- n 1)))
