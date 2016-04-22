(define pow
  (lambda (n m)
    (define pow-iter
      (lambda (prod i)
        (if (> i m) prod (pow-iter (* prod n) (+ i 1)))))
    (pow-iter 1 1)))
