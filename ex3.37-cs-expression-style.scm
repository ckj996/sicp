(load "cs-connector.scm")
(load "cs-adder.scm")
(load "cs-multiplier.scm")
(load "cs-constant.scm")
(load "cs-probe.scm")

(define (c+ a b)
  (let ((c (make-connector)))
    (adder a b c)
    c))

(define (c- c a)
  (let ((b (make-connector)))
    (adder a b c)
    b))

(define (c* a b)
  (let ((c (make-connector)))
    (multiplier a b c)
    c))

(define (c/ c a)
  (let ((b (make-connector)))
    (multiplier a b c)
    b))

(define (cv x)
  (let ((a (make-connector)))
    (constant x a)
    a))

;; test
(define (celsius-fahrenheit-converter x)
  (c+ (c* (c/ (cv 9) (cv 5))
          x)
      (cv 32)))

(define C (make-connector))
(define F (celsius-fahrenheit-converter C))
(probe "Celsius temp" C)
(probe "Fahrenheit temp" F)
