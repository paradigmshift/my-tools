;;;; package.lisp

(defpackage #:my-tools
  (:use #:cl)
  (:export #:permutations
           #:a-swap
           #:l-swap
           #:p-factors))

(defpackage #:my-tools-tests
  (:use #:cl #:lisp-unit #:my-tools))
