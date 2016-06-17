(define z 100)
(define (f x)
  (+ x (let* ((x 2000)
              (y (* 10 x)))
         (+ y
            (let* ((x 1000)
                   (y (* 2 x)))
              (+ x (+ y z)))))))
