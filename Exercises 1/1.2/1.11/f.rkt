#lang racket/base
(define (f-recursion n)
  (if (< n 3)
      n
      (+
       (f-recursion (- n 1))
       (f-recursion (- n 2))
       (f-recursion (- n 3)))))
(define (f-iteration n) 
  (define (f-iter a b c count)
    (if (<= count 0)
        a
        (f-iter b c (+ a b c) (- count 1))))
  (f-iter 0 1 2 n))