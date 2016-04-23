(define fact
  (lambda (n)
    (define fact-iter
      (lambda (prod i)
        (if (> i n) prod (fact-iter (* prod i) (+ i 1)))))
    (fact-iter 1 1)))
(define fib
  (lambda (n)
    (cond ((eq? n 0) 0)
          ((eq? n 1) 1)
          (else (+ (fib (- n 1)) (fib (- n 2)))))))
(define pow
  (lambda (n m)
    (define pow-iter
      (lambda (prod i)
        (if (> i m) prod (pow-iter (* prod n) (+ i 1)))))
    (pow-iter 1 1)))
(define fpow
  (lambda (n m)
    (define iseven
      (lambda (x)
        (cond ((< x 0) (iseven (* x -1)))
              ((eq? x 0) #t)
              ((eq? x 1) #f)
              (else (iseven (- x 2))))))
    (cond ((eq? m 0) 1)
          ((eq? m 1) n)
          ((iseven m) (fpow (* n n) (/ m 2)))
          (else (* (fpow (* n n) (/ (- m 1) 2)) n)))))
(define log2
  (lambda (n)
    (define log2-iter
      (lambda (i)
        (if (> (fpow 2 i) n) (- i 1) (log2-iter (+ i 1)))))
    (log2-iter 0)))
(define binom
  (lambda (n k)
    (cond ((eq? n k) 1)
          ((eq? k 1) n)
          (else (+ (binom (- n 1) k) (binom (- n 1) (- k 1)))))))
(define quad
  (lambda (x)
    (define quad-iter
      (lambda (sum i)
        (let ((abs-x (if (< x 0) (- 0 x) x)))
          (if (< i abs-x) (quad-iter (+ sum abs-x) (+ i 1)) sum))))
    (quad-iter 0 0)))
(define prime?
  (lambda (n)
    (define mod
      (lambda (x y)
        (if (< x y) x (mod (- x y) y))))
    (define prime?-iter
      (lambda (i)
        (cond ((eq? n 1) #f)
              ((> (* i i) n) #t)
              ((eq? (mod n i) 0) #f)
              (else (prime?-iter (+ i 1))))))
    (prime?-iter 2)))
