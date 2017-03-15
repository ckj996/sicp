(load "ex3.50-stream-map.scm")

(define (add-streams . s)
  (apply stream-map
         (cons + s)))
