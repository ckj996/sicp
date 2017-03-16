(define (display-stream s n)
  (newline)
  (display (stream-car s))
  (if (> n 0) (display-stream (stream-cdr s) (- n 1))))
