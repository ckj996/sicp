(load "ex2.46.scm") ;vect
(load "ex2.50.scm") ;transform-painter

(define (beside painter)
  (let ((split-point (make-vect 0.5 0.0)))
    (let ((paint-left
           (transform-painter (make-vect 0.0 0.0)
                              split-point
                              (make-vect 0.0 1.0)))
          (paint-right
           (transform-painter split-point
                              (make-vect 1.0 0.0)
                              (add-vect split-point
                                        (make-vect 0.0 1.0)))))
      (lambda (frame)
        (paint-left frame)
        (paint-right frame)))))

(define (below painter)
  (let ((split-point (make-vect 0.0 0.5)))
    (let ((paint-top
           (transform-painter split-point
                              (add-vect split-point
                                        (make-vect 1.0 0.0))
                              (make-vect 0.0 1.0)))
          (paint-bottom
           (transform-painter (make-vect 0.0 0.0)
                              (make-vect 1.0 0.0)
                              split-point)))
      (lambda (frame)
        (paint-top frame)
        (paint-bottom frame)))))
