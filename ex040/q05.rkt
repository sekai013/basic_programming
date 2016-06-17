(define perm
  (lambda (l)
    (define delete
      (lambda (e l)
        (cond ((null? l) '())
              ((eq? e (car l)) (delete e (cdr l)))
              (else (cons (car l) (delete e (cdr l)))))))
    (define perm-lll
      (lambda (l1 l2 l3)
        (if (null? l1)
          (cons l2 l3)
          (foldr
            (lambda (x y)
              (perm-lll (delete x l1) (cons x l2) y))
            l3
            l1))))
    (perm-lll l '() '())))
