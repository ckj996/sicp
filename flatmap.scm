(define (flatmap func seqs)
  (fold-right append
              '()
              (map func seqs)))
