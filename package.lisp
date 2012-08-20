;;;; package.lisp

(defpackage #:my-tools
  (:use #:cl)
  (:export #:permute
           #:array-switch
           #:list-switch
           #:list-factors))

(defpackage #:my-tools-tests
  (:use #:cl #:lisp-unit #:my-tools))
