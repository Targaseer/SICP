#lang racket/base
(define (fast-expt base exp)
  (define (fast-expt-iter a b n)
    (cond ((= n 0) a)
          ((= (remainder n 2) 0) (fast-expt-iter a (* b b) (/ n 2)))
          (else (fast-expt-iter (* a b) b (- n 1)))))
  (fast-expt-iter 1 base exp))