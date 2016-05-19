(define pow
  (lambda (n m)
    (if (zero? m)
      1
      (* n (pow n (- m 1))))))

(define poly
  (lambda (x l)
    (define poly-iter
      (lambda (l i)
        (if (null? l)
          0
          (+ (* (car l) (pow x i)) (poly-iter (cdr l) (+ i 1))))))
    (poly-iter l 0)))
