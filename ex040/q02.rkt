(define conc
  (lambda (l)
    (if (null? l)
      '()
      (append (car l) (conc (cdr l))))))
