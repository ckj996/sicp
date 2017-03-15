(load "ex3.50-stream-map.scm")

(define (mul-streams . s)
  (apply stream-map
         (cons * s)))
