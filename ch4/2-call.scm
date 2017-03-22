;; call
;; (call operator operands)
;;   operator: a symbol
;;   operands: list of expressions
(define (call? exp) (tagged-list? exp 'call))

(define (operator exp) (cadr exp))

(define (operands exp) (cddr exp))
