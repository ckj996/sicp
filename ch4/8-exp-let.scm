;; let
;; (let bindings body) or (let name bindings body)
;;   name: a variable
;;   bindings: list of (var exp)
;;   body: list of expressions
(define (let? exp) (tagged-list? exp 'let))

(define (named-let? exp) (variable? (cadr exp)))

(define (let-name exp)
  (if (named-let? exp)
      (cadr exp)))
(define (let-bindings exp)
  (if (named-let? exp)
      (caddr exp)
      (cadr exp)))
(define (let-body exp)
  (if (named-let? exp)
      (cdddr exp)
      (cddr exp)))

(define (binding-var binding) (car binding))
(define (binding-exp binding) (cadr binding))

(define (let-vars exp)
  (map binding-var (let-bindings exp)))
(define (let-exps exp)
  (map binding-exp (let-bindings exp)))

(define (let->lambda exp)
  (if (named-let exp)
      (make-lambda (let-vars exp)
                   (list (make-define (let-name exp)
                                      (make-lambda (let-vars exp)
                                                   (let-body exp)))
                         (cons (let-name exp)
                               (let-vars exp))))
      (make-lambda (let-vars exp)
                   (let-body exp))))

(define (let->combination exp)
  (cons (let->lambda exp)
        (let-exps exp)))

(define (make-let bindings body)
  (cons 'let (cons bindings body)))
