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
(define EST->JST
  (lambda (t) 
    (let ((result (+ t EST-JST-DIFF)))
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
(define CEST->JST
  (lambda (t) 
    (let ((result (+ t CEST-JST-DIFF)))
      (cond
        ((> result 24) (- result 24))
        ((< result 0) (+ result 24))
        (else result)))))
(define JST->CEST
  (lambda (t) 
    (let ((result (- t CEST-JST-DIFF)))
      (cond
        ((> result 24) (- result 24))
        ((< result 0) (+ result 24))
        (else result)))))
