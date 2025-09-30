(define (identity x) x)
(define (inc x) (+ x 1))

(define (product term a next b)
  (define (prod a acc)
    (if (> a b)
      acc
      (prod (next a) (* acc (term a)))))

  (prod a 1))


(define (factorial n)
  (define (fact n acc)
    (if (= n 1)
      acc
      (fact (- n 1) (* acc n))))
  (fact n 1))

(define (factorial2 n)
  (product identity 1 inc n))

(factorial 8)
(factorial2 8)

(define (f n from)
  (define (term x) (+ x 2.0))
  (define (next x)
    ;(display (+ x 2.0))
    (+ x 2.0))
  (product term from next (* 2 n)))

(define (g n from)
  (define (term x) (+ x 2.0))
  (define (next x)
    ;(display (+ x 2.0))
    (+ x 2.0))
  (product term from next (+ (* 2 n) 1)))

;(f 1 0)
;(f 2 2)
;(g 1 1)
;(g 1 1)

(define (h n)
  (* (/ (f n 0) (g n 1))
     (/ (f (+ n 1) 2) (g n 1))))

(* (h 100) 4)


