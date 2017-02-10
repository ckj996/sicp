(load "ex2.56.scm")

(define (exponent e)
  (if (null? (cdddr e))
      (caddr e)
      (cons '** (cddr e))))

(define (augend s)
  (if (null? (cdddr s))
      (caddr s)
      (cons '+ (cddr s))))

(define (multiplicand p)
  (if (null? (cdddr p))
      (caddr p)
      (cons '* (cddr p))))
