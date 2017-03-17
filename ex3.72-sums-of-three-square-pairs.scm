(load "ex3.70-merge-weighted.scm")
(load "stream-pairs.scm")
(load "display-stream.scm")

(define (interleave s t)
  (merge-weighted s t weight))

(define (weight pair)
  (+ (square (car pair))
     (square (cadr pair))))

(define int-pairs (pairs integers integers))

(define sums-of-three-square-pairs
  (stream-map (lambda (x) (list (weight (car x)) x))
              (stream-filter (lambda (x)
                               (= (weight (car x))
                                  (weight (cadr x))
                                  (weight (caddr x))))
                             (stream-map list
                                         int-pairs
                                         (stream-cdr int-pairs)
                                         (stream-cdr
                                          (stream-cdr int-pairs))))))
