(define (smallest-divisor n) (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))
(define (divides? a b) (= (remainder b a) 0))

(define (next n)
  (if (= n 2) 3 (+ n 2)))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
    (report-prime (- (runtime) start-time) n) false))
(define (report-prime elapsed-time n)
  (display n)
  (display " *** ")
  (display elapsed-time)
  (newline)
  n)

(define (find-three-primes-from n count)
  (cond ((= count 3) count)
        ((timed-prime-test n) (find-three-primes-from (+ n 1) (+ count 1)))
        (else (find-three-primes-from (+ n 1) count))))

(timed-prime-test 4)
(timed-prime-test 5)
(timed-prime-test 6)
(timed-prime-test 7)

(find-three-primes-from 10000000000000 0)
