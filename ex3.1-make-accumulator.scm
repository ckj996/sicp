(define (make-accumulator value)
  (lambda (x)
    (set! value (+ value x))
    value))
