(define pow2
  (lambda (x) (* x x)))

(define pow4
  (lambda (x) (pow2 (pow2 x))))

(define pow6
  (lambda (x) (* (pow2 x) (pow4 x))))

(define pow10
  (lambda (x) (* (pow4 x) (pow6 x))))
