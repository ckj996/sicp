(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    amount)
  (let ((err-count 0)
        (max-err 7))
    (define (dispatch p m)
      (if (eq? p password)
          (begin
            (set! err-count 0)
            (cond ((eq? m 'withdraw) withdraw)
                  ((eq? m 'deposit) deposit)
                  (else (error "Unknown request -- MAKE-ACCOUNT"
                               m))))
          (begin
            (set! err-count (+ err-count 1))
            (if (>= err-count max-err)
                call-the-cops
                wrong-password-message))))
    dispatch))

(define wrong-password-message
  (lambda (x)
    "Incorrect password"))

(define call-the-cops
  (lambda (x)
    "Calling the cops"))
