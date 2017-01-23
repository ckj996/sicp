(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low (enumerate-interval (+ low 1) high))))

(define (flatmap func seqs)
  (fold-right append
              '()
              (map func seqs)))

(define (unique-pairs n)
  (flatmap (lambda (i)
             (map (lambda (j) (list i j))
                  (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))

;; prime
(load "ex1.22.scm")

(define (prime-sum-pairs n)
  (map (lambda (pair)
         (list (car pair)
               (cadr pair)
               (+ (car pair)
                  (cadr pair))))
       (filter (lambda (pair)
                 (prime? (+ (car pair)
                            (cadr pair))))
               (unique-pairs n))))
