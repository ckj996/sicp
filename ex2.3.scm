(define (make-rect w h) (cons w h))
(define (width-rect r) (car r))
(define (height-rect r) (cdr r))

(define (area-rect r)
  (* (width-rect r)
     (height-rect r)))

(define (perimeter-rect r)
  (define (double x) (+ x x))
  (double (+ (width-rect r)
             (height-rect r))))

(load "ex2.2.scm")

(define (make-rect diagonal) diagonal)
(define (width-rect r)
  (abs (- (x-point (start-segment r))
          (x-point (end-segment r)))))
(define (height-rect r)
  (abs (- (y-point (start-segment r))
          (y-point (end-segment r)))))
