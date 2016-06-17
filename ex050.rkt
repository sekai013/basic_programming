(define EST-CEST-DIFF 6)
(define EST-JST-DIFF 13)
(define CEST-JST-DIFF 7)
(define EST->CEST
  (lambda (t) 
    (let ((result (+ t EST-CEST-DIFF)))
      (cond
        ((> result 24) (- result 24))
        ((< result 0) (+ result 24))
        (else esult)))))
(define CEST->EST
  (lambda (t) 
    (let ((result (- t EST-CEST-DIFF)))
      (cond
        ((> result 24) (- result 24))
        ((< result 0) (+ result 24))
        (else result)))))
(define JST->EST
  (lambda (t) 
    (let ((result (- t EST-JST-DIFF)))
      (cond
        ((> result 24) (- result 24))
        ((< result 0) (+ result 24))
        (else result)))))
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
(define invm
  (lambda (a b c d)
    (let ((det (- (* a d) (* b c))))
      (if (= det 0.0)
        #f
        (list (/ d det) (/ (* c -1) det) (/ (* b -1) det) (/ a det))))))
(define pow
  (lambda (n m)
    (cond ((eq? m 0) 1)
          ((eq? m 1) n)
          ((even? m) (let ((half (pow n (/ m 2)))) (* half half)))
          (else (let ((half (pow n (/ (- m 1) 2)))) (* n half half))))))
