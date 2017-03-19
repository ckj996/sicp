(load "random-numbers.scm")

(define (random-numbers-in-range low high)
  (let ((range (- high low)))
    (stream-map (lambda (x) (exact->inexact
                             (+ low (* range (/ x random-max)))))
                random-numbers)))
