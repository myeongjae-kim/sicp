(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (even? n)
  (= (remainder n 2) 0))

(fast-expt 2 2)
(fast-expt 2 3)
(fast-expt 2 10)

(define (fast-expt-iter b n)
  (define (fast-expt-iter-inner b n result)
    (cond ((= n 0) result)
          ((even? n) (fast-expt-iter-inner (square b) (/ n 2) result))
          (else (fast-expt-iter-inner b (- n 1) (* result b)))))

  (fast-expt-iter-inner b n 1))

(fast-expt-iter 2 2)
(fast-expt-iter 2 3)
(fast-expt-iter 2 10)
