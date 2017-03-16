(load "ex3.55-partial-sums.scm")
(load "display-stream.scm")

(define (ln2-summands n)
  (cons-stream (/ 1.0 n)
               (stream-map - (ln2-summands (+ n 1)))))

(define ln2-stream
  (partial-sums (ln2-summands 1)))

;; demo
(newline)
(display "original sequence:")
(display-stream ln2-stream 8)
(newline)
(display "euler transform:")
(display-stream (euler-transform ln2-stream) 8)
(newline)
(display "accelerated sequence:")
(display-stream (accelerated-sequence euler-transform ln2-stream) 8)
