(define (subsets s)
  (if (null? s)
      '(())
      (let ((rest (subsets (cdr s))))
        (append rest
                (map (lambda (set)
                       (cons (car s) set))
                     rest)))))
