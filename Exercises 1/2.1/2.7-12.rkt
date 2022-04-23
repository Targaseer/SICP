#lang racket/base

(define (make-interval a b) (cons a b))
(define (lower-bound interval) (car interval))
(define (upper-bound interval) (cdr interval))

(define (add-interval x y)
    (make-interval
        (+ (lower-bound x) (lower-bound y))
        (+ (upper-bound x) (upper-bound y))))
(define (mul-interval x y)
    (let (
        (p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval 
        (min p1 p2 p3 p4)
        (max p1 p2 p3 p4))))
(define (div-interval x y)
    (if (and (< (lower-bound y) 0) (> (upper-bound y) 0))
        (error "Division by an interval that spans zero")
        (mul-interval
            x
            (make-interval
                (/ 1.0 (upper-bound y))
                (/ 1.0 (lower-bound y))))))
;2.8
(define (sub-interval x y)
    (make-interval
        (- (upper-bound x) (lower-bound y))
        (- (lower-bound x) (upper-bound y))))

(define (print-interval interval)
    (display (lower-bound interval))
    (display " ... ")
    (display (upper-bound interval))
    (newline))

(define r1 (make-interval 6.12 7.48))
(define r2 (make-interval 4.465 4.935))
(define one (make-interval 1 1))
(print-interval (div-interval one (add-interval (div-interval one r1) (div-interval one r2))))
(define a (make-interval -4.465 4.935))
(print-interval (div-interval one a))

(define (make-center-width c w)
    (make-interval (- c w) (+ c w)))
(define (center i)
    (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
    (/ (- (upper-bound i) (lower-bound i)) 2))
(define (make-center-percent c w-perc)
    (make-center-width c (* (/ c 100) w-perc)))
(define (percent i)
    (* (/ (center i) 100) (width i)))
