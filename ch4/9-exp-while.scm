;; while
;; (while predicate body)
;; repeat body while condition is true
;;   predicate: an expression
;;   body: list of expressions
(define (while? exp) (tagged-list? exp 'while))

(define (while-predicate exp) (cadr exp))
(define (while-body exp) (cddr exp))

(define (while->define exp)
  (make-define '*while*
               (make-lambda '(result)
                            (make-if (while-predicate exp)
                                     (list '*while*
                                           (sequence->exp
                                            (while-body exp)))
                                     'result))))
(define (while->combination exp)
  (list (make-lambda '()
                     (while->define exp)
                     (list '*while*
                           '*unspecified-return-value*))))
