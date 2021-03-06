;; calculate offset of (x y) in stream (pairs integers integers)

(define (offset x y)
  (+ (- (expt 2 x) 2)
     (if (= x y)
         0
         (+ (expt 2 (- x 1))
            (* (- y x 1)
               (expt 2 x))))))

(load "stream-pairs.scm")

(define (find-index stream item)
  (define (iter s index)
    (if (equal? (stream-car s) item)
        index
        (iter (stream-cdr s) (+ index 1))))
  (iter stream 0))

(load "stream-integers.scm")

;; demo
(define s (pairs integers integers))

(define (test x y)
  (newline)
  (display (list x y))
  (newline)
  (display "calculated: ")
  (display (offset x y))
  (newline)
  (display "actual value: ")
  (display (find-index s (list x y)))
  (newline))

(test 1 100)
(test 10 10)
(test 10 11)
(test 10 12)
