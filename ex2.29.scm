;; part a)

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch m) (car m))
(define (right-branch m) (cadr m))

(define (branch-length b) (car b))
(define (branch-structure b) (cadr b))

;; part b)

(define (total-weight m)
  (define mobile? pair?)
  (if (mobile? m)
      (+ (total-weight (branch-structure (left-branch m)))
         (total-weight (branch-structure (right-branch m))))
      m))

;; part c)

(define (balance-mobile? m)
  (define mobile? pair?)
  (define (torque b)
    (* (branch-length b)
       (total-weight (branch-structure b))))
  (or (not (mobile? m))
      (and (= (torque (left-branch m))
              (torque (right-branch m)))
           (balance-mobile? (branch-structure (left-branch m)))
           (balance-mobile? (branch-structure (right-branch m))))))

;; part d)

(define (make-mobile left right)
  (cons left right))

(define (make-branch length structure)
  (cons length structure))

(define (left-branch m) (car m))
(define (right-branch m) (cdr m))

(define (branch-length b) (car b))
(define (branch-structure b) (cdr b))
