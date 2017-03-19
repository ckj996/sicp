(load "ex3.82-random-numbers-in-range.scm")
(load "map-successive-pairs.scm")
(load "monte-carlo.scm")

(define (estimate-integral in-area? low high)
  (stream-map (lambda (x) (* (square (- high low)) x))
              (monte-carlo (map-successive-pairs
                            in-area?
                            (random-numbers-in-range low high))
                  0
                  0)))

(define pi-stream
  (stream-map exact->inexact
   (estimate-integral (lambda (x y)
                        (<= (+ (square x)
                               (square y))
                            1.0))
                      -1.0
                      1.0)))
