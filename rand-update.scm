(define random-max 131313136)
(define random-init 0)

(define (rand-update x)
  (let ((a (expt 2 31))
        (c 1103515245)
        (m (+ random-max 1)))
    (modulo (+ (* a x) c) m)))
