(define upto
  (lambda (x n)
    (if (zero? n)
      (cons x '())
      (append (upto x (- n 1)) (cons (+ x n) '())))))
