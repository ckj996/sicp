(define (raise x)
  (apply-generic 'raise x))

;; (install-scheme-number-package)
(put 'raise '(scheme-number)
     (lambda (x)
       (make-rational x 1)))

;; (install-rational-package)
(put 'raise '(rational)
     (lambda (x)
       (make-complex-from-real-imag (/ (numer x)
                                       (denom x))
                                    0)))
