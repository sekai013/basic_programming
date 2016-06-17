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
