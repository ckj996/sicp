(define (cons x y)
  (* (expt 2 x)
     (expt 3 y)))

(define (car z)
  (define (iter z x)
    (if (= (remainder z 2) 0)
        (iter (/ z 2) (+ x 1))
        x))
  (iter z 0))

(define (cdr z)
  (define (iter z y)
    (if (= (remainder z 3) 0)
        (iter (/ z 3) (+ y 1))
        y))
  (iter z 0))
