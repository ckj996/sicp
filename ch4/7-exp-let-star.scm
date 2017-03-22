;; let*
;; (let* bindings body)
;;   eval bindings from left to let 
(define (let*? exp) (tagged-list? exp 'let*))

(define (let*->nested-lets exp)
  (define (iter bindings)
    (if (null? bindings)
        (let-body exp)
        (make-let (list (car bindings))
                  (iter (cdr bindings)))))
  (iter (let-bindings exp)))
