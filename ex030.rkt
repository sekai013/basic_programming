(define fst car)
(define snd (lambda (l) (car (cdr l))))
(define thd (lambda (l) (car (cdr (cdr l)))))
(define (t1 n)
  (cons n (cons (* 2 n) (cons (* 3 n) '()))))
(define (t2 n)
  (list 1 n (* n n)))
(define (t3 n)
  (list (- n 1) n (+ n 1)))
(define len
  (lambda (l)
    (if (null? l)
      0
      (+ 1 (len (cdr l))))))
(define dbls
  (lambda (l)
    (if (null? l)
      '()
      (cons (* (car l) 2) (dbls (cdr l))))))
(define pos
  (lambda (l)
    (cond ((null? l) '())
          ((< (car l) 0) (pos (cdr l)))
          (else (cons (car l) (pos (cdr l)))))))
(define pow
  (lambda (n m)
    (if (zero? m)
      1
      (* n (pow n (- m 1))))))
(define poly
  (lambda (x l)
    (define poly-iter
      (lambda (l i)
        (if (null? l)
          0
          (+ (* (car l) (pow x i)) (poly-iter (cdr l) (+ i 1))))))
    (poly-iter l 0)))
(define downto
  (lambda (x n)
    (if (zero? n)
      (cons x '())
      (cons (+ x n) (downto x (- n 1))))))
(define upto
  (lambda (x n)
    (if (zero? n)
      (cons x '())
      (append (upto x (- n 1)) (cons (+ x n) '())))))
(define prime?
  (lambda (n)
    (define mod
      (lambda (x y)
        (if (< x y) x (mod (- x y) y))))
    (define prime?-iter
      (lambda (i)
        (cond ((eq? n 1) #f)
              ((> (* i i) n) #t)
              ((eq? (mod n i) 0) #f)
              (else (prime?-iter (+ i 1))))))
    (prime?-iter 2)))
(define primes
  (lambda (n)
    (cond ((eq? n 1) '())
          ((prime? n) (append (primes (- n 1)) (cons n '())))
          (else (primes (- n 1))))))
(define (apnd xs ys)
  (if (null? xs)
    ys
    (cons (car xs) (apnd (cdr xs) ys))))
(define rev
  (lambda (l)
    (if (null? l)
      '()
      (apnd (rev (cdr l)) (cons (car l) '())))))
