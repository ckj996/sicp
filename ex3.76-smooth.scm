(define (smooth s)
  (define (avg x y)
    (/ (+ x y) 2))
  (stream-map avg s (cons-stream 0 s)))
