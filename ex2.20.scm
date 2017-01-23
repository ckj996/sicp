(define (same-parity first . others)
  (define (others-list same-parity? others-left)
    (cond ((null? others-left) '())
          ((same-parity? (car others-left))
           (cons (car others-left)
                 (others-list same-parity? (cdr others-left))))
          (else (others-list same-parity? (cdr others-left)))))
  (cons first
        (others-list (if (odd? first)
                         odd?
                         even?)
                     others)))
