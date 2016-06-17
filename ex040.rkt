(define t1
  (list '(0) '(1 2) '()))
(define t2
  (cons '(0) (cons '(1 2) (cons '() '()))))
(define t3
  (append '((0)) '((1 2) ())))
(define conc
  (lambda (l)
    (if (null? l)
      '()
      (append (car l) (conc (cdr l))))))
(define tails
  (lambda (l)
    (if (null? l)
      (cons '() '())
      (cons l (tails (cdr l))))))
(define combi
  (lambda (l)
    (if (null? l)
      '(())
      (let
        ((combicdr (combi (cdr l))))
        (append
          (map
            (lambda (l1) (cons (car l) l1))
            (combi (cdr l)))
          (combi (cdr l)))))))
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
