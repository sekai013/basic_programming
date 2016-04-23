(define bar
  (lambda (y)
    (define iseven
      (lambda (x)
        (cond ((< x 0) (iseven (* x -1)))
              ((eq? x 0) #t)
              ((eq? x 1) #f)
              (else (iseven (- x 2))))))
    (if (iseven y) 1 -1)))
(define pow2
  (lambda (x) (* x x)))
(define maximum
  (lambda (x y) (if (< x y) y x)))
(define minimum
  (lambda (x y) (if (> x y) y x)))
(define cmp2
  (lambda (x y)
    (cond ((< x y) 1)
          ((> x y) -1)
          (else 0))))
(define iseven
  (lambda (x)
    (cond ((< x 0) (iseven (* x -1)))
          ((eq? x 0) #t)
          ((eq? x 1) #f)
          (else (iseven (- x 2))))))
(define pow4
  (lambda (x) (pow2 (pow2 x))))
(define pow6
  (lambda (x) (* (pow2 x) (pow4 x))))
(define pow10
  (lambda (x) (* (pow4 x) (pow6 x))))
(define pow
  (lambda (b p)
    (cond ((eq? p 0) 1)
          ((eq? p 1) b)
          ((iseven p) (pow (pow2 b) (/ p 2)))
          (else (let* ((new-p (/ (- p 1) 2)) (pow-result (pow (pow2 b) new-p))) (* pow-result b))))))
(define sum-upto-ten
  (lambda (sum b i)
    (if (< i 10) (sum-upto-ten (+ sum (pow b i)) b (+ i 1)) sum)))
(define ps
  (lambda (x) (sum-upto-ten 0 x 0)))
(define dom
  (lambda (x y z)
    (define dom-iter
      (lambda (neg notneg li)
        (cond ((eq? li '()) (maximum neg notneg))
              ((< (car li) 0) (dom-iter (+ neg 1) notneg (cdr li)))
              (else (dom-iter neg (+ notneg 1) (cdr li))))))
    (dom-iter 0 0 (list x y z))))
