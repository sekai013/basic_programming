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
