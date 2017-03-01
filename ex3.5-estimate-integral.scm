(load "ex3.5-random-in-range.scm")
(load "ex3.5-monte-carlo.scm")

(define (estimate-integral p? x1 x2 y1 y2 trails)
  (let ((area (* (- x2 x1)
                 (- y2 y1))))
    (* area
       (monte-carlo trails
                    (lambda ()
                      (p? (random-in-range x1 x2)
                          (random-in-range y1 y2)))))))

(define (get-pi trails)
  (exact->inexact
   (estimate-integral (lambda (x y)
                        (<= (+ (square x)
                               (square y))
                            1.0))
                      -1.0
                      1.0
                      -1.0
                      1.0
                      trails)))
