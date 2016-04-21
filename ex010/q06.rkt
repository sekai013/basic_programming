(define pow2
  (lambda (x) (* x x)))

(define pow4
  (lambda (x) (pow2 (pow2 x))))
