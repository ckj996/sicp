(define (pascal-triangle row col)
  (if (or (= col 1) (= col row))
      1
      (+ (pascal-tree (- row 1)
                      (- col 1))
         (pascal-tree (- row 1)
                      col))))
