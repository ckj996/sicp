(define (and? exp) (tagged-list? exp 'and))
(define (or? exp) (tagged-list? exp 'or))

(define (and-exps exp) (cdr exp))
(define (or-exps exp) (cdr exp))

(define (eval-and exp env)
  (define (iter exps)
    (cond ((null? exps) 'true)
          ((eval (first-exp exps) env) (iter (rest-exps exps)))
          (else 'false)))
  (iter (and-exps exp)))

(define (eval-or exp env)
  (define (iter exps)
    (cond ((null? exps) 'false)
          ((eval (first-exp exps) env) 'true)
          (else (iter (rest-exps exps)))))
  (iter (or-exps exp)))
