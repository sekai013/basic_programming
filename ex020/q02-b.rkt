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
