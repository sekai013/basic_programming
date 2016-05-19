(require "q10.rkt")

(define rev
  (lambda (l)
    (if (null? l)
      '()
      (apnd (rev (cdr l)) (cons (car l) '())))))
