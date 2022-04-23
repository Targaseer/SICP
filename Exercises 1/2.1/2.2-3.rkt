#lang racket/base

(define (make-point x y)
    (cons x y))
(define (x-point point) (car point))
(define (y-point point) (cdr point))
(define (print-point p)
    (newline)
    (display "(")
    (display (x-point p))
    (display ",")
    (display (y-point p))
    (display ")"))

;2.2------------------------------
(define (make-segment start-point end-point)
    (cons start-point end-point))
(define (start-segment segment) (car segment))
(define (end-segment segment) (cdr segment))

(define (midpoint-segment segment)
    (let (
            (s (start-segment segment))
            (e (end-segment segment)))
        (make-point 
            (+ (x-point s) (/ (- (x-point e) (x-point s)) 2)) 
            (+ (y-point s) (/ (- (y-point e) (y-point s)) 2)))))
    

(define f-point (make-point 1 2))
(define s-point (make-point -7 -3))
(define seg (make-segment f-point s-point))
(print-point (midpoint-segment seg))

;2.3------------------------------
