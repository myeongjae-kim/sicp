(define (even? n)
  (= (remainder n 2) 0))

(define (double n) (+ n n))
(define (halve n) (/ n 2))

(define (* a b)
  (if (= b 0)
    0
    (cond ((even? b) (* (double a) (halve b)))
          (else (+ a (* a (- b 1)))))))

(* 2 5)
(* 3 5)
(* 9 9)
