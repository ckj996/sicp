(load "ex2.8.scm")

(define (width-interval x)
  (/ (- (upper-bound x)
        (lower-bound x))
     2.0))

;; example
(define (example)
  (let ((a (make-interval 1.0 3.04))
        (b (make-interval 1.0 1.8)))
    (newline)
    (display "a: ")
    (display (width-interval a))
    (newline)
    (display "b: ")
    (display (width-interval b))
    (newline)
    (display "add: ")
    (display (width-interval (add-interval a b)))
    (newline)
    (display "sub: ")
    (display (width-interval (sub-interval a b)))
    (newline)
    (display "mul: ")
    (display (width-interval (mul-interval a b)))
    (newline)
    (display "div: ")
    (display (width-interval (div-interval a b)))))
