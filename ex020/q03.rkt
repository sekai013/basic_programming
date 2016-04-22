(require "q02-b.rkt")

(define log2
  (lambda (n)
    (define log2-iter
      (lambda (i)
        (if (> (fpow 2 i) n) (- i 1) (log2-iter (+ i 1)))))
    (log2-iter 0)))
