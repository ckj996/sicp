(load "scale-stream.scm")
(load "ex3.60-mul-series.scm")
(load "ex3.61-invert-series.scm")

(define (div-series num denom)
  (let ((scale (stream-car denom)))
    (if (= scale 0)
        (error "denom series constant term is zero -- DIV-SERIES" s2)
        (mul-series (scale-stream num (/ scale))
                    (invert-unit-series (scale-stream denom
                                                      (/ scale)))))))
