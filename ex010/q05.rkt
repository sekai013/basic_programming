(define bar
  (lambda (y)
    (define iseven
      (lambda (x)
        (cond ((< x 0) (iseven (* x -1)))
              ((eq? x 0) #t)
              ((eq? x 1) #f)
              (else (iseven (- x 2))))))
    (if (iseven y) 1 -1)))