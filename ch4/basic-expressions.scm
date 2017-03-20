;; self evaluating
;; s
;; s: a number or a string
(define (self-evaluating? exp)
  (cond ((number? exp) true)
        ((string? exp) true)
        (else false)))

;; variable
;; v
;; v: a symbol
(define (variable? exp) (symbol? exp))

;; helper function: check tag of a list
;; '(tag ...) <=> (list 'tag '...)
;;   tag: a symbol
(define (tagged-list? exp tag)
  (if (pair? exp)
      (eq? (car exp tag))
      false))

;; quote
;; 'text <=> (quote text)
;;   text: a symbol or a list
(define (quoted? exp)
  (tagged-list? exp 'quote))

(define (text-of-quotation exp)
  (cadr exp))

;; set!
;; (set! variable value)
;;   variable: a symbol
;;   value: an expression
(define (assignment? exp) (tagged-list? exp 'set!))

(define (assignment-variable exp) (cadr exp))

(define (assignment-value exp) (caddr exp))

;; define
;; (define variable value)
;; (define (variable parameters) body)
;;     <=> (define variable (lambda parameters body))
;;   variable: a symbol
;;   value: an expression
(define (definition? exp) (tagged-list? exp 'define))

(define (definition-variable exp)
  (if (symbol? (cadr exp))
      (cadr exp)
      (caadr exp)))

(define (definition-value exp)
  (if (symbol? (cadr exp))
      (caddr exp)
      (make-lambda (cdadr exp)
                   (cddr exp))))

;; lambda
;; (lambda parameters body)
;;   parameters: list of symbols
;;   body: list of expressions
(define (lambda? exp) (tagged-list? exp 'lambda))

(define (lambda-parameters exp) (cadr exp))

(define (lambda-body exp) (cddr exp))

(define (make-lambda parameters body)
  (cons 'lambda (cons parameters body)))

;; if
;; (if predicate consequent alternative)
;; (if predicate consequent)
;;   predicate: an expression
;;   consequent: an expression
;;   alternative: an expression
(define (if? exp) (tagged-list? exp 'if))

(define (if-predicate exp) (cadr exp))

(define (if-consequent exp) (caddr exp))

(define (if-alternative exp)
  (if (not (null? (cdddr exp)))
      (cadddr exp)
      'false))

(define (make-if predicate consequent alternative)
  (list 'if predicate consequent alternative))

;; begin
;; (begin actions)
;;   actions: list of expressions
(define (begin? exp) (tagged-list? exp 'begin))

(define (begin-actions exp) (cadr exp))

(define (last-exp? seq) (null? (cdr seq)))

(define (first-exp seq) (car seq))

(define (rest-exps seq) (cdr seq))

(define (sequence->exp seq)
  (cond ((null? seq) seq)
        ((last-exp? seq) (first-exp seq))
        (else (make-begin seq))))

(define (make-begin seq) (cons 'begin seq))

;; operands
;; (operator operands)
;;   operator: a symbol
;;   operands: list of expressions
(define (application? exp) (pair? exp))

(define (operator exp) (car exp))

(define (operands exp) (cdr exp))

(define (no-operands? ops) (null? ops))

(define (first-operand ops) (car ops))

(define (rest-operands ops) (cdr ops))
