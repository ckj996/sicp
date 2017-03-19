(define (monte-carlo expirenment-stream passed failed)
  (define (next passed failed)
    (cons-stream
     (/ passed (+ passed failed))
     (monte-carlo
      (stream-cdr expirenment-stream) passed failed)))
  (if (stream-car expirenment-stream)
      (next (+ passed 1) failed)
      (next passed (+ failed 1))))
