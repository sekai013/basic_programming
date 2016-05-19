(define (apnd xs ys)
  (if (null? xs)
    ys
    (cons (car xs) (apnd (cdr xs) ys))))
