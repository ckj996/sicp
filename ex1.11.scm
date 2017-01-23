(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))
(define (ff n)
  (define (f-iter n a b c)
    (if (= 0 n)
        a
        (f-iter (- n 1)
                b
                c
                (+ (* a 3)
                   (* b 2)
                   c))))
  (f-iter n 0 1 2))
