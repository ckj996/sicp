(load "huffman-code-tree.scm")
(load "huffman-set.scm")

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge set)
  (cond ((null? set) (error "empty set -- SUCCESSIVE-MERGE"))
        ((null? (cdr set)) (car set))
        (else
         (let ((first (car set))
               (second (cadr set))
               (others (cddr set)))
           (successive-merge (adjoin-set (make-code-tree first second)
                                         others))))))
