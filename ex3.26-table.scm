(define (make-table = <)

  (define (make-tree key value left-branch right-branch)
    (list key value left-branch right-branch))

  (define (key-tree tree) (car tree))
  (define (value-tree tree) (cadr tree))
  (define (left-branch tree) (caddr tree))
  (define (right-branch tree) (cadddr tree))

  (define (set-key! tree key) (set-car! tree key))
  (define (set-value! tree value) (set-car! (cdr tree) value))
  (define (set-left-branch! tree left-branch)
    (set-car! (cddr tree) left-branch))
  (define (set-right-branch! tree right-branch)
    (set-car! (cdddr tree) right-branch))

  (define (tree-lookup key tree)
    (if (null? tree)
        false
        (let ((current-key (key-tree tree)))
          (cond ((= key current-key)
                 tree)
                ((< key current-key)
                 (tree-lookup key (left-branch tree)))
                (else
                 (tree-lookup key (right-branch tree)))))))

  (define (tree-insert! key value tree)
    (if (null? tree)
        (make-tree key value '() '())
        (let ((current-key (key-tree tree)))
          (cond ((= key current-key)
                 (set-value! tree value))
                ((< key current-key)
                 (set-left-branch! tree
                                   (tree-insert! key
                                                 value
                                                 (left-branch tree))))
                (else
                 (set-right-branch! tree
                                    (tree-insert! key
                                                  value
                                                  (right-branch tree)))))
          tree)))

  (let ((local-tree '()))

    (define (insert! key value)
      (set! local-tree
            (tree-insert! key value local-tree)))

    (define (lookup key)
      (let ((record (tree-lookup key local-tree)))
        (if record
            (value-tree record)
            false)))

    (define (dispatch m)
      (cond ((eq? m 'insert!) insert!)
            ((eq? m 'lookup) lookup)
            (else (error "Unknown option -- DISPATCH" m))))

    dispatch))
