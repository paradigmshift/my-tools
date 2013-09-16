;;;; package.lisp

(defpackage #:my-tools
  (:use #:cl)
  (:export #:permutations
           #:insert
           #:p-factors
           #:slurpfile
           #:slurp-to-string
           #:split
           #:match))

(defpackage #:my-tools-tests
  (:use #:cl #:lisp-unit #:my-tools))
