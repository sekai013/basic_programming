(define quad
  (lambda (x)
    (define quad-iter
      (lambda (sum i)
        (let ((abs-x (if (< x 0) (- 0 x) x)))
          (if (< i abs-x) (quad-iter (+ sum abs-x) (+ i 1)) sum))))
    (quad-iter 0 0)))
