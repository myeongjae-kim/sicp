(define (fringe x)
  (if (null? x)
    '()
    (let ((head (car x))
          (tail (cdr x)))
      (append
        (if (pair? head)
          (fringe head)
          (list head))
        (fringe tail)))))

(define (fringe-2 x)
  (define (fringe-inner x acc)
    (if (null? x)
      acc
      (let ((head (car x))
            (tail (cdr x)))
        (if (pair? head)
          (fringe-inner tail (fringe-inner head acc))
          (fringe-inner tail (cons head acc))))))
  (reverse (fringe-inner x '())))


(define x (list (list 1 2) (list 3 4)))
(fringe x)
(fringe (list x x))
(fringe (list
          (list 1 (list 2 3)
                (list
                  (list
                    (list 4 5)
                    6 7)
                  8 9))))
(fringe-2 (list
            (list 1 (list 2 3)
                  (list
                    (list
                      (list 4 5)
                      6 7)
                    8 9))))
