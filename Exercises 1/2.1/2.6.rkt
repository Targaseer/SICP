#lang racket/base

(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n)
    (lambda (f) (lambda (x) (f ((n f) x)))))

;(add-1 zero)
;(lambda (f) (lambda (x) (f ((zero f) x)))))
;(lambda (f) (lambda (x) (f ((lambda (x') x') x)))))
(define one (lambda (f) (lambda (x) (f x))))
;(add-1 one)
;(lambda (f) (lambda (x) (f ((one f) x)))))
;(lambda (f) (lambda (x) (f ((lambda (f1) (lambda (x1) (f1 x1))) x))))
;(lambda (f) (lambda (x) (f (lambda (x1) (x x1)))))
