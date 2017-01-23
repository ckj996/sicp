(load "ex1.22.scm")

(define (smallest-devisor n)
  (define (find-devisor n test-devisor)
    (cond ((> (square test-devisor) n) n)
          ((= (remainder n test-devisor) 0) test-devisor)
          (else (find-devisor n (next-odd test-devisor)))))
  (find-devisor n 2))
