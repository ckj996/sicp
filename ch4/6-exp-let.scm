;; let
;; (let pairs body)
;;   pairs: list of (var exp)
;;   body: list of expressions
(define (let? exp) (tagged-list? 'let))

(define (let-pairs exp) (cadr exp))
(define (let-body exp) (cddr exp))

(define (pair-var pair) (car pair))
(define (pair-exp pair) (cadr pair))

(define (let->lambda exp)
  (make-lambda (map pair-var (let-pairs exp))
               (let-body exp)))

(define (let->combination exp)
  (list (let->lambda exp)
              (map pair-exp (let-pairs exp))))
