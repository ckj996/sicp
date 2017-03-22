;; cond
;; (cond clauses)
;;   clauses: list of clause
;;   clause: (predicate actions) or (predicate => action)
;;     predicate: an expression or a symbol 'else
;;     actions: list of expressions
(define (cond? exp) (tagged-list? exp 'cond))

(define (cond-clauses exp) (cdr exp))

(define (cond-else-clause? clause)
  (eq? (cond-predicate clause) 'else))

(define (test=>recipient? clause)
  (eq? (cadr clause) '=>))
(define (cond-test clause)
  (car clause))
(define (cond-recipient clause)
  (caddr clause))

(define (cond-predicate clause) (car clause))
(define (cond-actions clause) (cdr clause))

(define (cond->if exp)
  (expand-clauses (cond-clauses exp)))

(define (expand-clauses clauses)
  (if (null? clauses)
      'false
      (let ((first (car clauses))
            (rest (cdr clauses)))
        (cond ((cond-else-clause? first)
               (if (null? rest)
                   (sequence->exp (cond-actions first))
                   (error "ELSE clause isn't last -- COND->IF"
                          clauses)))
              ((test=>recipient? first)
               (make-if (cond-test first)
                        (cond-recipient first)
                        (expand-clauses rest)))
              (else
               (make-if (cond-predicate first)
                        (sequence->exp (cond-actions first))
                        (expand-clauses rest)))))))
