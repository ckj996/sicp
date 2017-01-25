(define (make-vect x y) (cons x y))
(define (xcor-vect v) (car v))
(define (ycor-vect v) (cdr v))

(define (add-vect v u)
  (make-vect (+ (xcor-vect v)
                (xcor-vect u))
             (+ (ycor-vect v)
                (ycor-vect u))))

(define (sub-vect v u)
  (make-vect (- (xcor-vect v)
                (xcor-vect u))
             (- (ycor-vect v)
                (ycor-vect u))))

(define (scale-vect n v)
  (make-vect (* n (xcor-vect v))
             (* n (ycor-vect v))))
