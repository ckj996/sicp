;; unbound variable like set-variable-value!
;; eg. unbound the first match in the env
;; compatible with 11-environment.scm
(define (make-unbound! var env)
  (define (env-loop env)
    (define (scan bindings last)
      (cond ((null? bindings)
             (env-loop (enclosing-environment env)))
            ((eq? var (first-var bindings))
             (set-cdr! last (rest-bindings bindings))
             'ok)
            (else (scan (rest-bindings bindings) bindings))))
    (if (eq? env the-empty-environment)
        'var-not-bounded
        (let ((frame (first-frame env))
              (bindings (frame-bindings (first-frame env))))
          (cond ((null? bindings) (env-loop (enclosing-environment env)))
                ((eq? var (first-var bindings))
                 (set-car! frame (cdar frame))
                 'ok)
                (else (scan (rest-bindings bindings) bindings))))))
  (env-loop env))
