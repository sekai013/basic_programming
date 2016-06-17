(define invm
  (lambda (a b c d)
    (let ((det (- (* a d) (* b c))))
      (if (= det 0.0)
        #f
        (list (/ d det) (/ (* c -1) det) (/ (* b -1) det) (/ a det))))))
