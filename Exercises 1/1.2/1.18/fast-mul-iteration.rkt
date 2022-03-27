#lang racket/base
(define (double a) (+ a a))
(define (halve b) (/ b 2))
(define (fast-mul x y)
  (define (fast-mul-iter a b n)
    (cond ((= n 0) a)
          ((= (remainder n 2) 0) (fast-mul-iter a (double b) (halve n)))
          (else (fast-mul-iter (+ a b) b (- n 1)))))
  (fast-mul-iter 0 x y))