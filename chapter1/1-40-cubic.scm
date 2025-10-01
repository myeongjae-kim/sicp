(define (average a b)
  (/ (+ a b) 2))

(define (average-damp f)
  (lambda (x) (average x (f x))))

;((average-damp square) 10)

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

;(fixed-point cos 1.0)

(define (sqrt x)
  (fixed-point (average-damp (lambda (y) (/ x y)))
               1.0))

;(sqrt 144)

(define (cube-root x)
  (fixed-point (average-damp (lambda (y) (/ x (square y))))
               1.0))

;(cube-root 64)

(define dx 0.00001)
(define (deriv g)
  (lambda (x) (/ (- (g (+ x dx)) (g x)) dx)))

(define (cube x) (* x x x))
;((deriv cube) 5)

(define (newton-transform g)
  (lambda (x) (- x (/ (g x) ((deriv g) x)))))
(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

(define (sqrt x)
  (newtons-method
    (lambda (y) (- (square y) x)) 1.0))

;(sqrt 4)

(define (cubic a b c)
  (lambda (x) (+ (* x x x) (* a x x) (* b x) c)))

;((cubic 1 2 3) 2); 8 + 4 + 4 + 3

(newtons-method (cubic -3 3 -1) 2); (x-1)^3
(newtons-method (cubic -6 12 -8) 3); (x-2)^3
