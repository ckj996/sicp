(load "flatmap.scm")
(load "enumerate-interval.scm")

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter safe?
                (flatmap
                 (lambda (rest-of-queens)
                   (map (lambda (new-row)
                          (adjoin-position new-row rest-of-queens))
                        (enumerate-interval 1 board-size)))
                 (queen-cols (- k 1))))))
  (queen-cols board-size))

(define empty-board '())

(define (adjoin-position new-row rest-of-queens)
  (cons new-row rest-of-queens))

(define (safe? positions)
  (define (iter-safe? i other-pos)
    (or (null? other-pos)
        (let ((pos-k (car positions))
              (pos-i (car other-pos)))
          (and (not (or (= pos-k pos-i)
                        (= i (abs (- pos-k pos-i)))))
               (iter-safe? (+ i 1) (cdr other-pos))))))
  (iter-safe? 1 (cdr positions)))

(define (show-col pos board-size)
  (if (= 0 board-size)
      '()
      (cons (if (= 1 pos)
                1
                0)
            (show-col (- pos 1) (- board-size 1)))))
