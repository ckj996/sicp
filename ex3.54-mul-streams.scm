(define (mul-streams . s)
  (apply stream-map
         (cons * s)))
