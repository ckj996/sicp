(define (add-streams . s)
  (apply stream-map
         (cons + s)))
