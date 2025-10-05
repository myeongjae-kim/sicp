(define (make-mobile left right)
  ;(list left right))
  (cons left right))

(define (make-branch length structure)
  ;(list length structure))
  (cons length structure))

(define left-branch car)
;(define right-branch cadr)
(define right-branch cdr)

(define branch-length car)
;(define branch-structure cadr)
(define branch-structure cdr)

(define (total-weight x)
  (+ (if (pair? (left-branch x))
       (total-weight (left-branch x))
       (branch-length x))
     (if (pair? (right-branch x))
       (total-weight (right-branch x))
       (branch-structure x))))

(total-weight
  (make-mobile
    (make-branch 1 (make-mobile
                     (make-branch 3 4)
                     (make-branch 3 4)))
    (make-branch 2 3)))

(define (balanced mobile)
  (= (total-weight (left-branch mobile))
     (total-weight (right-branch mobile))))

(balanced
  (make-mobile (make-branch 1 2)
               (make-branch 1 2)))
