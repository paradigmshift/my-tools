;;;; my-tools.lisp

(in-package #:my-tools)

;;; "my-tools" goes here. Hacks and glory await!

(defun list-switch (a b lst)
  "Switch elements at position a & b with each other"
  (let ((newlst (copy-list lst)))
    (psetf (nth a newlst) (nth b newlst)
           (nth b newlst) (nth a newlst))
    newlst))

(defun permute (lst)
  ;; reduces the results from start-algo function
  (let ((final nil))
    (mapcar (lambda (x)
              (if (= (length x) (length lst))
                  (push x final)))
            (start-algo lst))
    final))

(defun start-algo (lst)  
  (let ((container nil))
    (push (list (car lst) (cadr lst)) container)
    (push (list-switch 0 1 (car container)) container)
    (setf lst (cddr lst))
    (dotimes (n (length lst))
      (mapcar (lambda (x)
                (setf x (push (car lst) x))
                (push x container)
                (dotimes (i (1- (length x)))
                  (push (list-switch i (1+ i) (car container)) container)))
              container)
      (setf lst (cdr lst)))
    container))

(defun array-switch (x y array)
  (let ((new-array (copy-seq array)))
    (psetf (aref new-array x) (aref new-array y)
           (aref new-array y) (aref new-array x))
    new-array))

