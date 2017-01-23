(define (demo)
  (let ((a (make-center-percent 10 5))
        (b (make-center-percent 10 2)))
    (newline)
    ; a / a != 1
    (display (percent (div-interval a a)))
    (newline)
    (display (percent (div-interval a b)))))
