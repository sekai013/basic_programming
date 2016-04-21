(define maximum
  (lambda (x y) (if (< x y) y x)))

(define (dom x y z)
  (define (dom-iter neg notneg li)
    (cond ((eq? li '()) (maximum neg notneg))
          ((< (car li) 0) (dom-iter (+ neg 1) notneg (cdr li)))
          (else (dom-iter neg (+ notneg 1) (cdr li)))))
  (dom-iter 0 0 (list x y z)))
