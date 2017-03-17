(load "ex3.70-merge-weighted.scm")
(load "stream-pairs.scm")
(load "display-stream.scm")

(define (interleave s t)
  (merge-weighted s t weight))

(define (cube x)
  (* x x x))

(define (weight pair)
  (+ (cube (car pair))
     (cube (cadr pair))))

(define int-pairs (pairs integers integers))

(define Ramanujan-numbers
  (stream-map (lambda (x) (weight (car x)))
              (stream-filter (lambda (x)
                               (= (weight (car x))
                                  (weight (cdr x))))
                             (stream-map cons
                                         int-pairs
                                         (stream-cdr int-pairs)))))
