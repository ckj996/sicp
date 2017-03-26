(load "11-environment.scm")

(define (env-var-ops var env env-miss frame-miss frame-hit)
  (define (env-loop env)
    (define (scan bindings)
      (cond ((null? bindings)
             (frame-miss))
            ((eq? var (first-var bindings))
             (frame-hit bindings))
            (else (scan (rest-bindings bindings)))))
    (if (eq? env the-empty-environment)
        (env-miss)
        (scan (frame-bindings (first-frame env)))))
  (env-loop env))

(define (lookup-variable-value var env)
  (env-var-ops var
               env
               (lambda () (error "Unbound variable" var))
               (lambda ()
                 (lookup-variable-value var
                                        (enclosing-environment env)))
               (lambda (bindings) (first-val bindings))))

(define (set-variable-value! var val env)
  (env-var-ops var
               env
               (lambda () (error "Unbound variable" var))
               (lambda ()
                 (set-variable-value! var
                                      val
                                      (enclosing-environment env)))
               (lambda (bindings) (set-first-val! bindings val))))

(define (define-variable! var val env)
  (env-var-ops var
               env
               (lambda () (error "Environment is empty" env))
               (lambda ()
                 (add-binding-to-frame! var val (first-frame env)))
               (lambda (bindings) (set-first-val! bindings val))))
