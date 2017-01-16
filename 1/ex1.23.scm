(load "ex1.22.scm")

(define (smallest-devisor n)
  (define (next test-devisor)
    (if (= 2 test-devisor)
        3
        (+ test-devisor 2)))
  (define (find-devisor n test-devisor)
    (cond ((> (square test-devisor) n) n)
          ((= (remainder n test-devisor) 0) test-devisor)
          (else (find-devisor n (next test-devisor)))))
  (find-devisor n 2))
