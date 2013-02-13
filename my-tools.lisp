
;;;; my-tools.lisp

(in-package #:my-tools)

;;; "my-tools" goes here. Hacks and glory await!

(defun l-swap (a b lst)
  "Switch list elements at position a & b with each other"
  (let ((newlst (copy-list lst)))
    (psetf (nth a newlst) (nth b newlst)
           (nth b newlst) (nth a newlst))
    newlst))

(defun a-swap (x y array)
  "Switch array elements at position a & b with each other"
  (let ((new-array (copy-seq array)))
    (psetf (aref new-array x) (aref new-array y)
           (aref new-array y) (aref new-array x))
    new-array))

(defun p-factors (i)
  "List prime factors of i"
  (let ((factors '()))
    (labels ((factor-calc (x y)
			  (cond ((> (/ y 2) x) factors)
				((equal (mod x y) 0) (progn (push y factors)
							    (factor-calc (/ x y) y)))
				(t (factor-calc x (1+ y))))))
      (factor-calc i 2))))

(defun permutations (bag)
  "Return a list of all the permutations of the input."
  (declare (type sequence bag))
  (if (null bag) 
      '(())
      (mapcan #'(lambda (e)
		  (mapcar #'(lambda (p) (cons e p))
			  (permutations
			   (remove e bag :count 1))))
	      bag)))
