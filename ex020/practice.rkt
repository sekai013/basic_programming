(define fact
  (lambda (n)
    (define fact-iter
      (lambda (prod i)
        (if (> i n) prod (fact-iter (* prod i) (+ i 1)))))
    (fact-iter 1 1)))
