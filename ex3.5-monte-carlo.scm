(define (monte-carlo trails experiment)
  (define (iter trails-remaining trails-passed)
    (cond ((= trails-remaining 0)
           (/ trails-passed trails))
          ((experiment)
           (iter (- trails-remaining 1) (+ trails-passed 1)))
          (else
           (iter (- trails-remaining 1) trails-passed))))
  (iter trails 0))
