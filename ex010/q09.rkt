(define pow2
  (lambda (x) (* x x)))

(define iseven
  (lambda (x)
    (cond ((< x 0) (iseven (* x -1)))
          ((eq? x 0) #t)
          ((eq? x 1) #f)
          (else (iseven (- x 2))))))

(define pow
  (lambda (b p)
    (cond ((eq? p 0) 1)
          ((eq? p 1) b)
          ((iseven p) (pow (pow2 b) (/ p 2)))
          (else (let* ((new-p (/ (- p 1) 2)) (pow-result (pow (pow2 b) new-p))) (* pow-result b))))))

(define sum-upto-ten
  (lambda (sum b i)
    (if (< i 10) (sum-upto-ten (+ sum (pow b i)) b (+ i 1)) sum)))

(define ps
  (lambda (x) (sum-upto-ten 0 x 0)))
