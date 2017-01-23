(define (last-pair items)
  (if (null? (cdr items))
      '()
      (last-pair (cdr items))))
