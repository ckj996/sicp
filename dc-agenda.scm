(define (make-agenda)

  (let ((agenda '())
        (current-time 0))

    (define (get-time item) (car item))
    (define (get-action item) (cdr item))
    (define (make-item time action) (cons time action))

    (define (add-to-agenda! time action)
      (let ((new-item (make-item time action)))
        (define (iter current-agenda)
          (cond ((null? current-agenda)
                 (list new-item))
                ((< time (get-time (car current-agenda)))
                 (cons new-item current-agenda))
                (else
                 (set-cdr! current-agenda
                           (iter (cdr current-agenda)))
                 current-agenda)))
        (set! agenda (iter agenda))))

    (define (remove-first-item!)
      (if (null? agenda)
          (error "Empty agenda -- REMOVE-FIRST-ITEM!" agenda)
          (set! agenda (cdr agenda))))

    (define (dispatch m)
      (cond ((eq? m 'empty-agenda?)
             (null? agenda))
            ((eq? m 'first-item)
             (set! current-time (get-time (car agenda)))
             (get-action (car agenda)))
            ((eq? m 'current-time)
             current-time)
            ((eq? m 'add-to-agenda!)
             add-to-agenda!)
            ((eq? m 'remove-first-item!)
             (remove-first-item!))))

    dispatch))

(define (empty-agenda? agenda)
  (agenda 'empty-agenda?))

(define (first-agenda-item agenda)
  (agenda 'first-item))

(define (remove-first-agenda-item! agenda)
  (agenda 'remove-first-item!))

(define (add-to-agenda! time action agenda)
  ((agenda 'add-to-agenda!) time action))

(define (current-time agenda)
  (agenda 'current-time))
