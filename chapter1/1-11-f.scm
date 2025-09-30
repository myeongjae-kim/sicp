(define (f n)
  (if (< n 3)
    n
    (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))))

(define (f-iter n)
  (define (f-iter-inner n a b c)
    (cond ((< n 3) n)
          ((= n 3) a)
          (else (f-iter-inner (- n 1) (+ a (* 2 b) (* 3 c)) a b))))

  (f-iter-inner n 4 2 1))


(f 1)
(f 2)
(f 3)
(f 4)
(f 5)
(f 6)

(f-iter 1)
(f-iter 2)
(f-iter 3)
(f-iter 4)
(f-iter 5)
(f-iter 6)
