#lang racket/base
(define (pascal row col)
  (cond
    ((or (< col 0) (< row 0) (> col row)) 0)
    ((or (= col 0) (= col row)) 1)
    (else (+
           (pascal (- row 1) (- col 1))
           (pascal (- row 1) col)))))