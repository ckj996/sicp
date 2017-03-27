;; and
;; (and exps)
;; Lazy Evaluation, from left to right
(define (and? exp) (tagged-list? exp 'and))

(define (and-exps) (cdr exp))

(define (and->if exp)
  (expand-and (and-exps exp)))

(define (expand-and exps)
  (if (null? exps)
      'true
      (make-if (first-exp exps)
               (expand-and (rest-exps exps))
               'false)))
