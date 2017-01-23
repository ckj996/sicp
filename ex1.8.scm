(define (cube x)
  (* x x x))
(define (cubrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (cubrt-iter (improve guess x)
                  x)))
(define (improve guess x)
  (/ (+ (/ x
           (* guess guess))
        (+ guess guess))
     3))
(define (good-enough? guess x)
  (< (abs (- 1
             (/ (improve guess x)
                guess)))
     0.0001))
(define (cubrt x)
  (cubrt-iter 1.0 x))
