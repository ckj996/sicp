(define (=zero? x)
  (apply-generic '=zero? x))

;; (install-scheme-number-package)
(put '=zero? '(scheme-number)
     (lambda (x)
       (= x 0)))

;; (install-rational-package)
(put '=zero? '(rational)
     (lambda (x)
       (= (numer x) 0)))

;; (install-complex-package)
(put '=zero? '(complex)
     (lambda (x)
       (and (= (real-part x) 0)
            (= (imag-part x) 0))))
