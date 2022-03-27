#lang racket/base
(define (square a) (* a a))

(define (next a)
  (if (= a 2)
      3
      (+ a 1)))

(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (divides? a b) (= (remainder b a) 0))

(define (prime? a)
  (= (smallest-divisor a) a))

(define (timed-prime-test n)
  (newline)
  (display n)
  (newline)
  (start-prime-test n (current-inexact-milliseconds)))

(define (start-prime-test n start-time)
  (cond ((prime? n) (report-prime (- (current-inexact-milliseconds) start-time)))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(timed-prime-test 1009)
(timed-prime-test 1013)
(timed-prime-test 1019)
(newline)
(display "_____________________")
(newline)
(timed-prime-test 10007)
(timed-prime-test 10009)
(timed-prime-test 10037)
(newline)
(display "_____________________")
(newline)
(timed-prime-test 100003)
(timed-prime-test 100019)
(timed-prime-test 100043)
(newline)
(display "_____________________")
(newline)
(timed-prime-test 1000003)
(timed-prime-test 1000033)
(timed-prime-test 1000037)