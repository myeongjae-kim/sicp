(define (filtered-accumulate combiner null-value term a next b predicate)
  (define (iter a acc)
    (if (> a b)
      acc
      (iter
        (next a)
        (if (predicate a)
          (combiner acc (term a))
          acc)
        )))
  (iter a null-value))

(define (accumulate combiner null-value term a next b)
  (define (always-true x) true)
  (filtered-accumulate combiner null-value term a next b always-true))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))

(define (inc n) (+ n 1))
(define (identity x) x)

(define (sum-cubes a b)
  (sum cube a inc b))

(define (factorial n)
  (product identity 1 inc n))

(sum-cubes 1 10)
(factorial 4)


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


(define (sum-odd term a next b)
  (define (is-odd x)
    (= (remainder x 2) 1))
  (filtered-accumulate + 0 term a next b is-odd))

(sum-odd identity 1 inc 10)
(+ 1 3 5 7 9)
