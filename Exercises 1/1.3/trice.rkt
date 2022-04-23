#lang racket/base

(define (inc x) (+ x 1))

(define (trice f)
    (lambda (x) (f (f (f x)))))

((trice inc) 0)

(((trice trice) inc) 0)

(((trice (trice trice)) inc) 0)

(define (twice f)
    (lambda (x) (f (f x))))

(define (double a)
    (lambda (x) (* 2 a x)))

(define (procc)
    (define p 5)
    (double p)
)

((procc) 9)

(((twice (twice twice)) inc) 0)

(((twice (twice (twice twice))) inc) 0)

((twice (twice (twice (twice inc)))) 0)