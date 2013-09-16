(in-package #:my-tools-tests)

(define-test l-swap
  (assert-equal '(1 0 2 3) (l-swap 0 1 '(0 1 2 3))))

(define-test permutations
  (assert-equal 120 (length (permutations '(0 1 2 3 4)))))

(define-test a-swap
  (assert-equalp #(1 0 2 3) (a-swap 0 1 #(0 1 2 3))))

(define-test p-factors
  (assert-equal 13195 (reduce #'* (p-factors 13195)))
  (assert-equal '(5 2 2) (p-factors 20)))

(define-test insert
  (assert-equalp "hello</br> there" (insert "</br>" "hello there" 4))
  (assert-equalp "hello there</br>" (insert "</br>" "hello there" 11)))
