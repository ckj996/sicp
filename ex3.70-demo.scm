(load "ex3.70-merge-weighted.scm")
(load "stream-pairs.scm")
(load "display-stream.scm")

(define (interleave s t)
  (merge-weighted s t weight))

;; a)

(define (weight pair)
  (+ (car pair)
     (cadr pair)))

(newline)
(display "a:")
(display-stream (pairs integers integers) 20)

;; b)

(define (weight pair)
  (let ((i (car pair))
        (j (cadr pair)))
    (+ (* 2 i)
       (* 3 j)
       (* 5 i j))))

(define (divisible? a b)
  (= (remainder a b) 0))

(define (or-div-2-3-5? x)
  (or (divisible? x 2)
      (divisible? x 3)
      (divisible? x 5)))

(newline)
(display "b:")
(display-stream (stream-filter (lambda (pair)
                                 (or (or-div-2-3-5? (car pair))
                                     (or-div-2-3-5? (cadr pair))))
                               (pairs integers integers))
                20)
