(define (gcd x y)
  (if (= y 0)
      x
      (gcd y (remainder x y))))

(define (make-rat n d)
  (define (sign x)
    (if (negative? x) -1 1))
  (define (result-sign n d)
    (* (sign n) (sign d)))
  (let ((g (gcd n d)))
    (cons (* (result-sign n d) (abs (/ n g)))
          (abs (/ d g)))))

(define (print-rat x)
  (newline)
  (display (number x))
  (display "/")
  (display (denom x)))

(define (number x)
  (car x))

(define (denom x)
  (cdr x))

(define (add-rat x y)
  (make-rat (+ (* (number x) (denom y))
               (* (number y) (denom x)))
            (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (number x) (denom y))
               (* (number y) (denom x)))
            (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (number x) (number y))
            (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (number x) (denom y))
            (* (denom x) (number y))))

(define (equal-rat? x y)
  (and (= (number x) (number y))
       (= (denom x) (denom y))))
