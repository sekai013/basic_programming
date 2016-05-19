(define dbls
  (lambda (l)
    (if (null? l)
      '()
      (cons (* (car l) 2) (dbls (cdr l))))))
