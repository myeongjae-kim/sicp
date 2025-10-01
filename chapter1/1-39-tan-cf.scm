(define (cont-frac n d k)
  (define (next x k)
    (/ (n k) (+ (d k) x)))

  (define (cont-frac-inner k acc)
    (if (= k 0)
      acc
      (cont-frac-inner (- k 1) (next acc k))))

  (cont-frac-inner k 1))


(define (tan-cf x k)
  (cont-frac
    (lambda (i) (if (= i 1) x (- (square x))))
    (lambda (i) (- (* 2 i) 1))
    k))

(define quarter-pi (atan 1))

(tan-cf quarter-pi 1)
(tan-cf quarter-pi 2)
(tan-cf quarter-pi 3)
(tan-cf quarter-pi 4)
(tan-cf quarter-pi 5)
(tan-cf quarter-pi 6)
(tan quarter-pi)
