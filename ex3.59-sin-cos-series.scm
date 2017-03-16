(load "ex3.59-integrate-series.scm")

(define cosine-series
  (cons-stream 1
               (stream-map -
                           (integrate-series sine-series))))

(define sine-series
  (cons-stream 0
               (integrate-series cosine-series)))
