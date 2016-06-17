(define tails
  (lambda (l)
    (if (null? l)
      (cons '() '())
      (cons l (tails (cdr l))))))
