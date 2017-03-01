(load "ex3.3-make-account.scm")

(define (make-joint orig-acc orig-pass new-pass)
  (lambda (given-pass m)
    (if (eq? given-pass new-pass)
        (orig-acc orig-pass m)
        wrong-password-message)))
