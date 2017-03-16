(load "stream-integers.scm")

(define (integrate-series s)
  (stream-map (lambda (x y) (/ x y)) s integers))
