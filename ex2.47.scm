(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin-frame f) (car f))
(define (edge1-frame f) (cadr f))
(define (edge2-frame f) (caddr f))

(define (make-frame origin frame1 frame2)
  (cons origin (cons frame1 frame2)))

(define (origin-frame f) (car f))
(define (edge1-frame f) (cadr f))
(define (edge2-frame f) (cddr f))
