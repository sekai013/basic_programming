(define downto
  (lambda (x n)
    (if (zero? n)
      (cons x '())
      (cons (+ x n) (downto x (- n 1))))))
