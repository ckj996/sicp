(load "ex3.76-smooth.scm")

(define (make-zero-crossings sense-data)
  (let ((smoothed-sense-data (smooth sense-data)))
    (stream-map sign-change-detector
                smoothed-sense-data
                (cons-stream 0 smoothed-sense-data))))
