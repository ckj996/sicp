(load "ex1.23.scm")

(define (fast-prime? n times)
  (or (= 0 times)
      (and (prime-test? n (+ 1 (random (- n 1))))
           (fast-prime? n (- times 1)))))

(define (fermat-test? n a)
  (= (expmod a n n) a))

(define (prime-test? n a)
  (fermat-test? n a))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m)) m))
        (else (remainder (* (expmod base (- exp 1) m) base) m))))

(define (prime? n)
  (and (> n 1)
       (fast-prime? n 12)))
