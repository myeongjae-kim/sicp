(define (even? n)
  (= (remainder n 2) 0))

(define (double n) (+ n n))
(define (halve n) (/ n 2))

(define (* a b)
  (define (inner-* a b result)
    (cond ((= b 0) result)
          ((even? b) (inner-* (double a) (halve b) result))
          (else (inner-* a (- b 1) (+ result a)))))
  (inner-* a b 0))

(* 2 5)
(* 3 5)
(* 9 9)
