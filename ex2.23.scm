(define (for-each func items)
  (cond ((not (null? items))
         (func (car items))
         (for-each func (cdr items)))))
