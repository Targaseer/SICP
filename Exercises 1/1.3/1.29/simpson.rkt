#lang racket/base

(define (sum term a next b)
    (if (> a b)
        0
        (+ (term a)
            (sum term (next a) next b))))

(define (integral f a b dx)
    (define (add-dx x)
        (+ x dx))
    (* (sum f (+ a (/ dx 2.0)) add-dx b)
        dx))

(define (cube x) (* x x x))

(integral cube 0 1 0.01)

(define (simpson f a b n)
    (define (multiplier k)
        (if (= (remainder k 2) 0)
            2
            4))
    (let ((h (/ (- b a) n)))
        (* 
            (/ h 3)
            (foldl + 0 (append
                (list (f (+ a (* 0 h))))
                (build-list 
                    (- n 1) 
                    (lambda (k) (*
                        (multiplier (+ k 1))
                        (f (+ a (* (+ k 1) h))))))
                (list (f (+ a (* n h))))
        )))))

(define (rev x) (/ 1 x))
(simpson rev 0.1 1 1000)
