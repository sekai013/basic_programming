(define pos
  (lambda (l)
    (cond ((null? l) '())
          ((< (car l) 0) (pos (cdr l)))
          (else (cons (car l) (pos (cdr l)))))))
