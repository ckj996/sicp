(load "accumulate.scm")

(define (count-leaves t)
  (accumulate (lambda (this-branch right-branches-leaves)
                (+ (if (pair? this-branch)
                       (count-leaves this-branch)
                       1)
                   right-branches-leaves))
              0
              t))
