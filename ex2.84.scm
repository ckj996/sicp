(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (if (= (length args) 2)
              (let ((type1 (car type-tags))
                    (type2 (cadr type-tags))
                    (a1 (car args))
                    (a2 (cadr args)))
                (if (equal? type1 type2)
                    (error "No method for these types"
                           (list op type-tags))
                    (cond ((sub-type? t1 t2)
                           (apply-generic op (raise a1) a2))
                          ((sub-type? t2 t1)
                           (apply-generic op a1 (raise a2)))
                          (else
                           (error "No method for these types"
                                    (list op type-tags))))))
              (error "No method for these types"
                     (list op type-tags)))))))

(define (sub-type? x y)
  (in-set? x (apply-generic 'sub-types y)))

;; (install-scheme-number-package)
(put 'sub-types '(scheme-number) '())

;; (install-rational-package)
(put 'sub-types '(rational) '(scheme-number))

;; (install-complex-package)
(put 'sub-types '(complex) '(rational scheme-number))
