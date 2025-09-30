(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (+ result (term a)))))
  (iter a 0))

(define (inc n) (+ n 1))
(define (sum-cubes a b)
  (sum cube a inc b))

;(sum-cubes 1 10)

(define (integral f a b dx)
  (define (add-dx x)
    (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define (integral2 f a b n)
  (define h (/ (- b a) n))

  (define (y k)
    (f (+ a (* k h))))

  (define (sum-inner k)
    (cond ((or (= k 0) (= k n)) (y k))
          ((= (remainder k 2) 1) (* (y k) 4))
          ((= (remainder k 2) 0) (* (y k) 2))))

  (define (my-term k result)
    (if (= k n)
      result
      (my-term (+ k 1) (+ result (sum-inner (+ k 1))))))

  (define (term k)
    (cond ((or (= k 0) (= k n)) (y k))
          ((= (remainder k 2) 1) (* (y k) 4))
          ((= (remainder k 2) 0) (* (y k) 2))))

  (* (/ h 3)
     (my-term 0.0 0)
     ;(sum term 0.0 inc n)
     ))


(integral cube 0 1 0.01)
(integral2 cube 0 1.0 100)

(integral cube 0 1 0.001)
(integral2 cube 0 1.0 1000)

(integral2 cube 0 1 2)
