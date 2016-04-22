(define binom
  (lambda (n k)
    (cond ((eq? n k) 1)
          ((eq? k 1) n)
          (else (+ (binom (- n 1) k) (binom (- n 1) (- k 1)))))))
