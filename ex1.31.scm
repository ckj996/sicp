(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (* result
                 (term a)))))
  (iter a 1))

(define (factorial n)
  (define (next x) (+ x 1))
  (define (term x) x)
  (product term 1 next n))

(define (cal-pi n)
  (define (next x) (+ x 1))
  (define (term x)
    (if (odd? x)
        (/ (+ x 1)
           (+ x 2))
        (/ (+ x 2)
           (+ x 1))))
  (* 4.0 (product term 1 next n)))
