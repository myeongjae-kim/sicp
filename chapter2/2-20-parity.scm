(define (is-odd x)
  (if (= (remainder x 2) 0) 0 1))

(is-odd 3)
(is-odd 4)

(define (same-parity . l)
  (define (same-parity-inner it)
    (if (null? it)
      '()
      (if (= (is-odd (car it)) (is-odd (car l)))
        (cons (car it) (same-parity-inner (cdr it)))
        (same-parity-inner (cdr it)))))
  (same-parity-inner l))

(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)
