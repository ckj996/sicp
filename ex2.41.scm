(load "enumerate-interval.scm")
(load "flatmap.scm")

(define (ordered-triples n)
  (flatmap (lambda (i)
         (flatmap (lambda (j)
                (map (lambda (k)
                       (list i j k))
                     (enumerate-interval 1 (- j 1))))
              (enumerate-interval 1 (- i 1))))
       (enumerate-interval 1 n)))

(define (triples-sum n s)
  (filter (lambda (triple)
            (= s
               (+ (car triple)
                  (cadr triple)
                  (caddr triple))))
          (ordered-triples n)))
