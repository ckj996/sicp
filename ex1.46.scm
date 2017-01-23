(load "ex1.40.scm")

(define (iterative-improve good-enough? improve)
  (define (iter guess)
    (let ((next (improve guess)))
      (if (good-enough? guess)
          next
          (iter next))))
  (lambda (first-guess)
    (iter first-guess)))

(define (fixed-point f first-guess)
  (define (improve guess) (f guess))
  (define tolerance 0.00001)
  (define (close-enough? x y)
    (< (abs (- x y)) tolerance))
  (define (good-enough? guess)
    (close-enough? guess (improve guess)))
  ((iterative-improve good-enough? improve) first-guess))

