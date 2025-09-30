(define (cont-frac n d k)
  (define (next x k)
    (/ (n k) (+ (d k) x)))


  (define (cont-frac-inner k acc)
    (if (= k 0)
      acc
      (cont-frac-inner (- k 1) (next acc k))))

  (cont-frac-inner k 1))


(+ 2 (cont-frac
       (lambda (i) 1.0)
       (lambda (i) 
         (if (= (remainder i 3) 2)
           (* 2 (ceiling (/ i 3)))
           1))
       11))
