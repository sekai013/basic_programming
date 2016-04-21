(define assert
  (lambda (a b) (cons a b)))

(define get-indexes
  (lambda (li) (let ((i 0)) (map (lambda (item) (set! i (+ i 1)) i) li))))

(define error-message
  (lambda (arg1 arg2 index)
    (string-append "Test No. " (number->string index) " failed. Expected " (x->string arg2) " but the value is " (x->string arg1) ".\n")))

(define check-test
  (lambda (assertion)
    (let* ((assert-arg (car assertion)) (arg1 (car assert-arg)) (arg2 (cdr assert-arg)) (index (cdr assertion)))
      (if (equal? arg1 arg2) "" (error-message arg1 arg2 index)))))

(define begin-test
  (lambda (test-name assert-list)
    (let* ((indexes (get-indexes assert-list))
           (indexed-assert-list (map cons assert-list indexes))
           (result (map check-test indexed-assert-list))
           (error-messages (filter (lambda (message) (not (equal? message ""))) result))
           (test-size (length result))
           (failed-test-size (length error-messages))
           (passed-test-size (- test-size failed-test-size)))
      (if (equal? test-name ".silent")
        (begin)
        (begin
          (display (string-append "Test " test-name " running...\n"))
          (map display error-messages)
          (display (string-append
                     (number->string test-size)
                     " Tests finished. "
                     (number->string passed-test-size)
                     " Passed. "
                     (number->string failed-test-size)
                     " Failed.\n"))
          ))
      error-messages)))

;; Tests
(equal? (assert 1 2) (cons 1 2))
(not (equal? (assert 1 2) (cons 1 3)))
(equal? (assert '(1 2) '(3 4)) (cons (list 1 2) (list 3 4)))

(equal? (get-indexes (list 123 "scheme" 56 '())) '(1 2 3 4))

(equal? (error-message "hoge" "piyo" 2) "Test No. 2 failed. Expected piyo but the value is hoge.\n")
(equal? (error-message '() '(1 2 3) 1000) "Test No. 1000 failed. Expected (1 2 3) but the value is ().\n")

(equal? (check-test (cons (cons 1 1) 999)) "")
(equal? (check-test (cons (cons 1 2) 3)) "Test No. 3 failed. Expected 2 but the value is 1.\n")

(equal? (begin-test ".silent" (list (assert 1 2) (assert 999 999) (assert '() '()) (assert '(1 2) '(1 2 4))))
        '("Test No. 1 failed. Expected 2 but the value is 1.\n" "Test No. 4 failed. Expected (1 2 4) but the value is (1 2).\n"))
