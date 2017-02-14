(load "ex2.62.scm")
(load "tree.scm")
(load "bst.scm")
(load "ex2.63.scm")
(load "ex2.64.scm")

(define (tree-intersection-set set1 set2)
  (list->tree (intersection-set (tree->list-2 set1)
                                     (tree->list-2 set2))))

(define (tree-union-set set1 set2)
  (list->tree (union-set (tree->list-2 set1)
                              (tree->list-2 set2))))
