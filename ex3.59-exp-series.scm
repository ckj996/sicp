(load "ex3.59-integrate-series.scm")

(define exp-series
  (cons-stream 1 (integrate-series exp-series)))
