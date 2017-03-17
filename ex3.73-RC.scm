(load "scale-stream.scm")
(load "add-streams.scm")
(load "stream-integral.scm")

(define (RC R C dt)
  (define (v i v0)
    (add-streams (scale-stream i R)
                 (integral (scale-stream i (/ C))
                           v0
                           dt)))
  v)
