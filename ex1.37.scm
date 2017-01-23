(define (cont-frac d n k)
  (define (helper i)
    (if (> i k)
        0
        (/ (n i)
           (+ (d i)
              (helper (+ i 1))))))
  (helper 1))

(define (cont-frac d n k)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1)
              (/ (n i)
                 (+ (d i)
                    result)))))
  (iter k 0))
