(define (attach-tag type-tag contents)
  (if (or (number? contents)
          (symbol? contents))
      contents
      (cons type-tag contents)))

(define (type-tag datum)
  (cond ((number? datum) 'scheme-number)
        ((symbol? datum) 'scheme-symbol)
        (else (car datum))))

(define (contents datum)
  (if (or (number? datum)
          (symbol? datum))
      datum
      (cdr datum)))
