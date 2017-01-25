(define (split combine sub-combine)
  (define (iter painter n)
    (if (= n 0)
        painter
        (let ((smaller (iter painter (- n 1))))
        (combine painter
                 (sub-combine smaller smaller)))))
  iter)
