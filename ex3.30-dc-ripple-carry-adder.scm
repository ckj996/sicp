(load "dc-full-adder.scm")

(define (ripple-carry-adder list-A list-B list-S C)
  (define (iter A B S C)
    (if (or (null? A)
             (null? B)
             (null? S))
        'ok
        (let ((Ak (car A))
              (Bk (car B))
              (Sk (car S))
              (Ck (make-wire))
              (A-left (cdr A))
              (B-left (cdr B))
              (S-left (cdr S)))
          (full-adder Ak Bk Ck Sk C)
          (iter A-left B-left S-left Ck))))
  (iter list-A list-B list-S C))
