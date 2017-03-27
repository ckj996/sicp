;; let
;; (let bindings body)
;;   bindings: list of (var exp)
;;   body: list of expressions
(define (let? exp) (tagged-list? exp 'let))

(define (let-bindings exp) (cadr exp))
(define (let-body exp) (cddr exp))

(define (binding-var binding) (car binding))
(define (binding-exp binding) (cadr binding))

(define (let-vars exp)
  (map binding-var (let-bindings exp)))
(define (let-exps exp)
  (map binding-exp (let-bindings exp)))

(define (let->lambda exp)
  (make-lambda (let-vars exp)
               (let-body exp)))

(define (let->combination exp)
  (cons (let->lambda exp)
        (let-exps exp)))

(define (make-let bindings body)
  (cons 'let (cons bindings body)))
