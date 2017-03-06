(define (front-ptr deque) (car deque))
(define (rear-ptr deque) (cdr deque))
(define (set-front-ptr! deque item) (set-car! deque item))
(define (set-rear-ptr! deque item) (set-cdr! deque item))

(define (empty-deque? deque) (or (null? (front-ptr deque))
                                 (null? (rear-ptr deque))))

(define (make-deque) (cons '() '()))

(define (make-node item prev next)
  (cons item
        (cons prev next)))
(define (item-node node) (car node))
(define (link-node node) (cdr node))
(define (prev-node node) (cadr node))
(define (next-node node) (cddr node))
(define (set-prev-node! node prev)
  (set-car! (link-node node) prev))
(define (set-next-node! node next)
  (set-cdr! (link-node node) next))

(define (front-deque deque)
  (if (empty-deque? deque)
      (error "FRONT called with an empty deque")
      (item-node (front-ptr deque))))
(define (rear-deque deque)
  (if (empty-deque? deque)
      (error "REAR called with an empty deque")
      (item-node (rear-ptr deque))))

(define (front-insert-deque! deque item)
  (let ((new-node (make-node item '() '())))
    (cond ((empty-deque? deque)
           (set-front-ptr! deque new-node)
           (set-rear-ptr! deque new-node))
          (else
           (set-next-node! new-node (front-ptr deque))
           (set-prev-node! (front-ptr deque) new-node)
           (set-front-ptr! deque new-node)))))

(define (rear-insert-deque! deque item)
  (let ((new-node (make-node item '() '())))
    (cond ((empty-deque? deque)
           (set-front-ptr! deque new-node)
           (set-rear-ptr! deque new-node))
          (else
           (set-prev-node! new-node (rear-ptr deque))
           (set-next-node! (rear-ptr deque) new-node)
           (set-rear-ptr! deque new-node)))))

(define (front-delete-deque! deque)
  (cond ((empty-deque? deque)
         (error "FRONT-DELETE called with an empty deque"))
        ((null? (next-node (front-ptr deque)))
         (set-front-ptr! deque '())
         (set-rear-ptr! deque '()))
        (else
         (set-prev-node! (next-node (front-ptr deque)) '())
         (set-front-ptr! deque (next-node (front-ptr deque))))))

(define (rear-delete-deque! deque)
  (cond ((empty-deque? deque)
         (error "REAR-DELETE called with an empty deque"))
        ((null? (prev-node (rear-ptr deque)))
         (set-front-ptr! deque '())
         (set-rear-ptr! deque '()))
        (else
         (set-next-node! (prev-node (rear-ptr deque)) '())
         (set-rear-ptr! deque (prev-node (rear-ptr deque))))))

(define (print-deque deque)
  (define (iter node)
    (if (null? node)
        '()
        (cons (item-node node)
              (iter (next-node node)))))
  (iter (front-ptr deque)))

