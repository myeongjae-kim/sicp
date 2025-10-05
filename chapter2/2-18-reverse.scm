(define (last-pair l)
  (if (null? (cdr l))
    (car l)
    (last-pair (cdr l))))

(last-pair (list 23 72 149 34))

(define (reverse l)
  (if (null? l)
    '()
    (append (reverse (cdr l)) (list (car l)))))

(reverse (list 1 4 9 16 25))
