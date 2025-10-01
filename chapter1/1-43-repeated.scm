(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (repeated-inner k acc)
    (if (= k 0)
      acc
      (repeated-inner (- k 1) (compose f acc))))

  (repeated-inner n f))

((repeated square 2) 5)
