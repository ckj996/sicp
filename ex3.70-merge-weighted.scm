(define (merge-weighted s t weight)
  (cond ((stream-null? s) t)
        ((stream-null? t) s)
        (else
         (let ((scar (stream-car s))
               (tcar (stream-car t)))
           (if (<= (weight scar) (weight tcar))
               (cons-stream scar
                            (merge-weighted (stream-cdr s)
                                            t
                                            weight))
               (cons-stream tcar
                            (merge-weighted s
                                            (stream-cdr t)
                                            weight)))))))
