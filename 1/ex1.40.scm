(load "ex1.35.scm")

(define (fixed-point-of-transform  g transfrom guess)
  (fixed-point (transfrom g) guess))

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx))
          (g x))
       dx)))

(define dx 0.00001)

(define (newton-transform g)
  (lambda (x)
    (- x
       (/ (g x)
          ((deriv g) x)))))

(define (average x y)
  (/ (+ x y) 2))

(define (average-damp f)
  (lambda (x)
    (average x (f x))))

(define (sqrt-1 x)
  (fixed-point-of-transform (lambda (y) (/ x y))
                            average-damp
                            1.0))

(define (sqrt-2 x)
  (fixed-point-of-transform (lambda (y) (- (square y) x))
                            newton-transform
                            1.0))

(define (cubic a b c)
  (define (cube x) (* x x x))
  (lambda (x) (+ (cube x)
                 (* a (square x))
                 (* b x)
                 c)))
