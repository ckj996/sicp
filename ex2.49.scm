(load "ex2.48.scm")
(load "ex2.47.scm")

(define (frame-coord-map frame)
  (lambda (v)
    (add-vect
     (origin-frame frame)
     (add-vect (scale-vect (xcor-vect v) (edge1-frame frame))
               (scale-vect (ycor-vect v) (edge2-frame frame))))))

(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
     (lambda (segment)
       (draw-line
        ((frame-coord-map frame)
         (start-segment segment))
        ((frame-coord-map frame)
         (end-segment segment))))
     segment-list)))

;; a.
(define draw-frame
  (segments->painter
   (list (make-segment (make-vect 0 0) (make-vect 0 1))
         (make-segment (make-vect 0 0) (make-vect 1 0))
         (make-segment (make-vect 0 1) (make-vect 1 1))
         (make-segment (make-vect 1 0) (make-vect 1 1)))))

;; b
(define draw-x
  (segments->painter
   (list (make-segment (make-vect 0 0) (make-vect 1 1))
         (make-segment (make-vect 0 1) (make-vect 1 0)))))

;; c
(define draw-diamond
  (segments->painter
   (list (make-segment (make-vect 0 0.5) (make-vect 0.5 0))
         (make-segment (make-vect 0 0.5) (make-vect 0.5 1))
         (make-segment (make-vect 1 0.5) (make-vect 0.5 0))
         (make-segment (make-vect 1 0.5) (make-vect 0.5 1)))))

;; d
; skipped

;; check
;(define (draw-line start end)
;  (newline)
;  (display "(")
;  (display (xcor-vect start))
;  (display ",")
;  (display (ycor-vect start))
;  (display ")")
;  (display "(")
;  (display (xcor-vect end))
;  (display ",")
;  (display (ycor-vect end))
;  (display ")"))
