(define (random-numbers request-stream)
  (define (random-reset stream)
    (let ((new-rand (stream-car stream)))
      (cons-stream new-rand
                   (random-proc (stream-cdr stream)
                                (rand-update new-rand)))))
  (define (random-proc stream rand)
    (cond ((stream-null? stream) false)
          ((eq? (stream-car stream) 'generate)
           (cons-stream rand
                        (random-proc (stream-cdr stream)
                                     (rand-update rand))))
          ((eq? (stream-car stream) 'reset)
           (random-reset (stream-cdr stream)))))
  (random-proc request-stream random-init))