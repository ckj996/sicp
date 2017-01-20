(load "ex2.8.scm")

(define (div-interval x y)
  (if (<= (lower-bound y)
          0
          (upper-bound y))
      (error "interval y spans 0")
      (mul-interval x
                    (make-interval (/ 1.0 (upper-bound y))
                                   (/ 1.0 (lower-bound y))))))
