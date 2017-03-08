(define (signal->boolean x)
  (cond ((and (number? x)
              (= x 1))
         true)
        ((and (number? x)
              (= x 0))
         false)
        (else
         (error "Invalid signal -- SIGNAL->BOOLEAN" x))))

(define (boolean->signal x)
  (if (boolean? x)
      (if x
          1
          0)
      (error "Invalid value -- BOOLEAN->SIGNAL" x)))

(define (logical-not x)
  (boolean->signal
   (not
    (signal->boolean x))))

(define (logical-and x y)
  (boolean->signal
   (and
    (signal->boolean x)
    (signal->boolean y))))

(define (logical-or x y)
  (boolean->signal
   (or
    (signal->boolean x)
    (signal->boolean y))))
