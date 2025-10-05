(define (reverse l)
  (if (null? l)
    '()
    (append (reverse (cdr l)) (list (car l)))))

(reverse (list 1 4 9 16 25))

(define (deep-reverse l)
  (define (deep-reverse-inner l)
    (if (null? l)
      '()
      (let ((head (car l))
            (tail (cdr l)))
        (cons
          (if (pair? head)
            (deep-reverse-inner (reverse head))
            head)
          (deep-reverse-inner tail)))))
  (reverse (deep-reverse-inner l)))

(define x (list (list 1 2) (list 3 4)))
x
(reverse x)
(deep-reverse x)
(deep-reverse (list (list 1 2 3) (list 4 5 (list 6 (list 7 8) 9))))
