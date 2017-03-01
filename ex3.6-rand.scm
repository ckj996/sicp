(define rand
  (let ((x random-init))
    (lambda (mode)
      (cond ((eq? mode 'generate)
             (set! x (rand-update x))
             x)
            ((eq? mode 'reset)
             (lambda (v)
               (set! x v)
               x))
            (else
             (error "Unknown mode -- RAND" mode))))))
