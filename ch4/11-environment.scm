;; binding
;; binding: (variable . value)
(define (make-binding var val) (cons var val))

(define (binding-var binding) (car binding))

(define (binding-val binding) (cdr binding))

(define (set-binding-val! binding val) (set-cdr! binding val))

;; frame
;; (bindings)
(define the-empty-frame '(()))

(define (make-frame bindings) (list bindings))

(define (frame-bindings frame) (car frame))

(define (rest-bindings bindings) (cdr bindings))

(define (first-var bindings) (binding-var (car bindings)))

(define (first-val bindings) (binding-val (car bindings)))

(define (set-first-val! bindings val)
  (set-binding-val! (car bindings) val))

(define (add-binding-to-frame! var val frame)
  (set-car! frame (cons (make-binding var val) (car frame))))

;; environment
;; (first-frame . enclosing-environment)
(define (enclosing-environment env) (cdr env))

(define (first-frame env) (car env))

(define the-empty-environment '())

(define (extend-environment vars vals base-env)
  (if (= (length vars) (length vals))
      (cons (make-frame (map make-binding vars vals))
            base-env)
      (if (< (length vars) (length vals))
          (error "Too many values supplied" vars vals)
          (error "Too few values supplied" vars vals))))
