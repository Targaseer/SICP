#lang racket/base

(define (cons a b)
    (* (expt 2 a) (expt 3 b)))
(define (car pair)
    (if (= (remainder pair 3) 0)
        (car (/ pair 3))
        (log pair 2)))
(define (cdr pair)
    (if (= (remainder pair 2) 0)
        (cdr (/ pair 2))
        (log pair 3)))

(define a (cons 6 19))
(car a)
(cdr a)
