;; and
;; (and exps)
;; Lazy Evaluation, from left to right
(define (or? exp) (tagged-list? exp 'or))

(define (or-exps) (cdr exp))

(define (or->if exp)
  (expand-or (or-exps exp)))

(define (expand-or exps)
  (if (null? exps)
      'false
      (make-if (first exps)
               'true
               (expand-or (rest-exps exps)))))
