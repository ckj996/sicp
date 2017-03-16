(load "ex3.60-mul-series.scm")

(define (invert-series sr)
  (define x (cons-stream 1
                         (stream-map -
                                     (mul-series x sr))))
  x)

(define (invert-unit-series s)
  (if (= (stream-car s) 1)
      (invert-series (stream-cdr s))
      (error "stream must begin with constant 1 -- INVERT-UNIT-SERIES")))
