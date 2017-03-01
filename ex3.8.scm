(define f
  (let ((flag #t))
    (lambda (x)
      (if flag
          (begin
            (set! flag #f)
            x)
          0))))
