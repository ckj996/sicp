(load "ex1.27.scm")

(define (miller-rabin-test? n a)
  (= (expmod-mrt a (- n 1) n) 1))

(define (prime-test? n a)
  (miller-rabin-test? n a))

(define (expmod-mrt base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m)) m))
        (else (remainder (* (expmod base (- exp 1) m) base) m))))

(define (sqrmod-mrt base m)
  (let ((result (remainder (square base) m)))
    (if (and (not (or (= base 1)
                      (= base (- m 1))))
             (= 1 result))
        0
        result)))
