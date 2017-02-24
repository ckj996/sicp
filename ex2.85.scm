(define (project x)
  (apply-generic 'project x))

;; (install-rational-package)
(put 'project '(rational)
     (lambda (x)
       (numer x)))

;; (install-complex-package)
(put 'project '(complex)
     (lambda (x)
       (real-part x)))

(define (drop x)
  (let (y (project x))
    (if (equ? (raise y) x)
        (drop y)
        x)))
