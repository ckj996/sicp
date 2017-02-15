(define (make-leaf symbol weight)
  (list 'leaf symbol weight))

(define (leaf? object)
  (and (pair? object)
       (eq? 'leaf (car object))))

(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))
