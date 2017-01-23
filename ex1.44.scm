(define dx 0.00001)

(define (smooth f)
  (define (average x y z) (/ (+ x y z) 3))
  (lambda (x)
    (average (f x)
             (f (- x dx))
             (f (+ x dx)))))

(load "ex1.43.scm")

(define (smooth-n-times f n)
  ((repeated smooth n) f))
