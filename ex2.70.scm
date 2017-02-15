(load "ex2.69-generate-huffman-tree.scm")
(load "ex2.68-huffman-encode.scm")
(load "huffman-decode.scm")

(define sample-pairs '((A 2) (NA 16)
                       (BOOM 1) (SHA 3)
                       (GET 2) (YIP 9)
                       (JOB 2) (WAH 1)))

(define tree (generate-huffman-tree sample-pairs))

(define message '(Get a Job
                  Sha na na na na na na na na
                  Get a Job
                  Sha na na na na na na na na
                  Wah yip yip yip yip yip yip yip yip yip
                  Sha boom))

(define code (encode message tree))

(newline)
(display message)

(newline)
(display code)

(newline)
(display (decode code tree))
