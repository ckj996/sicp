(define env-1 (extend-environment
               '(a b)
               '(1 2)
               the-empty-environment))

(define env-2 (extend-environment
               '()
               '()
               env-1))

(define (test expected actual name)
  (newline)
  (display name)
  (if (equal? expected actual)
      (display " -- OK")
      (display " -- Bad")))

(define (lookup env . vars)
  (map (lambda (var)
         (lookup-variable-value var env))
       vars))

(test '(1 2) (lookup env-1 'a 'b) "lookup-variable-value")
(test '(1 2) (lookup env-2 'a 'b) "lookup-variable-value")

(define-variable! 'b 3 env-1)
(define-variable! 'c 4 env-1)
(define-variable! 'a 5 env-2)

(test '(1 3 4) (lookup env-1 'a 'b 'c) "define-variable!")
(test '(5 3 4) (lookup env-2 'a 'b 'c) "define-variable!")

(set-variable-value! 'c 6 env-1)
(set-variable-value! 'a 7 env-2)
(set-variable-value! 'b 8 env-2)

(test '(1 8 6) (lookup env-1 'a 'b 'c) "set-variable-value")
(test '(7 8 6) (lookup env-2 'a 'b 'c) "set-variable-value")
