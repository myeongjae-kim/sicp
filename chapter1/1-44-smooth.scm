(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (repeated-inner k acc)
    (if (= k 0)
      acc
      (repeated-inner (- k 1) (compose f acc))))

  (repeated-inner n f))

(define dx 0.1)
(define (smooth f)
  (lambda (x)
    (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))

;((repeated square 2) 5)

((smooth square) 2)
(((repeated smooth 5) square) 2)
