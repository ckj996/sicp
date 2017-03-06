(define (make-table same-key?)

  (define (assoc key records)
    (cond ((null? records) false)
          ((same-key? key (caar records))
           (car records))
          (else (assoc key (cdr records)))))

  (let ((local-table (list '*table*)))

    (define (lookup . keys)
      (define (iter keys table)
        (if (null? keys)
            (cdr table)
            (let ((record (assoc (car keys) (cdr table))))
              (if record
                  (iter (cdr keys) record)
                  false))))
      (iter keys local-table))

    ;; NOTE: key value in different order
    (define (insert! value . keys)
      (define (iter keys table)
        (if (null? keys)
            (set-cdr! table value)
            (let ((current-key (car keys))
                  (keys-remain (cdr keys)))
              (let ((record (assoc current-key (cdr table))))
                (if record
                    (set-cdr! record (cdr (iter keys-remain record)))
                    (let ((subtable (list current-key)))
                      (set-cdr! table (cons (iter keys-remain
                                                  subtable)
                                            (cdr table))))))))
        table)
      (iter keys local-table))

    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc!) insert!)
            (else (error "Unknown operation -- TABLE" m))))

    dispatch))
