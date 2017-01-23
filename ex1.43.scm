(load "ex1.42.scm")

(define (repeated f times)
  (cond ((= times 1) f)
        ((even? times) (let ((g (repeated f (/ times 2))))
                         (compose g g)))
        (else (compose f (repeated f (- times 1))))))
