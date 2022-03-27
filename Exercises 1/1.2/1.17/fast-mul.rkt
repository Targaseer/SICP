#lang racket/base
(define (double a) (+ a a))
(define (halve b) (/ b 2))
(define (fast-mul a b)
  (cond ((= b 1) a)
        ((= (remainder b 2) 0) (double (fast-mul a (halve b))))
        (else (+ a (fast-mul a (- b 1))))))