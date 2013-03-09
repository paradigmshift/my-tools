
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

(defun insert (str document pos)
  "Insert str into a specific position in document"
  (when (> pos (length document))
    (error 'index-out-of-bounds :text pos))
  (if (< (1+ pos) (length document))
      (let ((half1 (subseq document 0 (1+ pos)))
            (half2 (subseq document (1+ pos))))
        (concatenate 'string half1 str half2))
      (concatenate 'string document str)))

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

(define-condition index-out-of-bounds (error)
  ((text :initarg :text :reader text)))
