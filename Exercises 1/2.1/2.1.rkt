#lang racket/base


(define (add-rat x y)
    (make-rat 
        (+  (* (numer x) (denom y))
            (* (numer y) (denom x)))
        (* (denom x) (denom y))))
(define (sub-rat x y)
    (make-rat 
        (-  (* (numer x) (denom y))
            (* (numer y) (denom x)))
        (* (denom x) (denom y))))
(define (mul-rat x y)
    (make-rat 
        (* (numer x) (numer y))
        (* (denom x) (denom y))))
(define (div-rat x y)
    (make-rat 
        (* (numer x) (denom y))
        (* (denom x) (numer y))))
(define (equal-rat? x y)
    (=  
        (* (numer x) (denom y))
        (* (numer y) (denom x))))

(define (make-rat n d)
    (let* (
            (n (if (< d 0) (* -1 n) n))
            (d (abs d))
            (g (gcd n d)))
        (cons (/ n g) (/ d g))))
(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
    (newline)
    (display (numer x))
    (display "/")
    (display (denom x)))

(print-rat (make-rat 1 2))
(print-rat (make-rat -1 2))
(print-rat (make-rat 1 -2))
(print-rat (make-rat -1 -2))
