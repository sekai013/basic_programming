(define qsolve
  (lambda (a b c)
    (let ((D (- (* b b) (* 4 a c))))
      (cond
        ((> D 0.0)
         (list
           (/ (+ (* b -1) (sqrt D)) (* 2 a))
           (/ (- (* b -1) (sqrt D)) (* 2 a))))
        ((= D 0.0) (list (/ (* b -1) (* 2 a))))
        (else '())))))
