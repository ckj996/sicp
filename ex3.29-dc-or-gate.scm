(load "dc-inverter.scm")
(load "dc-and-gate.scm")

(define (or-gate o1 o2 output)
  (let ((a1 (make-wire))
        (a2 (make-wire))
        (a-out (make-wire)))
    (inverter o1 a1)
    (inverter o2 a2)
    (and-gate a1 a2 a-out)
    (inverter a-out output)
    'ok))

;; or-gate-delay = 2 * inverter-delay + and-gate-delay
