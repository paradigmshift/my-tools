(in-package #:my-tools-tests)

(define-test list-switch
  (assert-equal '(1 0 2 3) (list-switch 0 1 '(0 1 2 3))))

(define-test permute
  (assert-equal 120 (length (permute '(0 1 2 3 4)))))

(define-test array-switch
  (assert-equalp #(1 0 2 3) (array-switch 0 1 #(0 1 2 3))))

(define-test list-factors
  (assert-equal 13195 (reduce #'* (list-factors 13195)))
  (assert-equal '(5 2 2) (list-factors 20)))
  
