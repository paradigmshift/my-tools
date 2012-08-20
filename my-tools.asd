;;;; my-tools.asd

(asdf:defsystem #:my-tools
  :serial t
  :depends-on (#:lisp-unit)
  :components ((:file "package")
               (:file "my-tools")
               (:file "my-tools-tests")))

