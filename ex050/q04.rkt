(define pow
  (lambda (n m)
    (cond ((eq? m 0) 1)
          ((eq? m 1) n)
          ((even? m) (let ((half (pow n (/ m 2)))) (* half half)))
          (else (let ((half (pow n (/ (- m 1) 2)))) (* n half half))))))
