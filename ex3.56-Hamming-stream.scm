(load "scale-stream.scm")
(load "ex3.56-merge-stream.scm")

(define S (cons-stream 1 (merge (scale-stream S 2)
                                (merge (scale-stream S 3)
                                       (scale-stream S 5)))))
