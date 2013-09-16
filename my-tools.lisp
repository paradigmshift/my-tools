;;;; my-tools.lisp

(in-package #:my-tools)

;;; "my-tools" goes here. Hacks and glory await!
(defconstant fail 'nil)

(defun slurpfile (fname)
  "Reads in an entire lisp file"
  (with-open-file (in fname
                      :direction :input)
    (let ((contents (loop
                       for line = (read in nil 'eof)
                       until (eq line 'eof)
                       collect line)))
      contents)))

(defun slurp-to-string (fname)
  "Returns as a string the contents of a file"
  (with-open-file (in fname
                      :direction :input)
    (let ((contents (make-string (file-length in))))
      (read-sequence contents in)
      contents)))

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

(defconstant no-bindings '((T. T)))

(defun symbol-index (x)
  (cond ((string= x "?*") 'match-segment)
        ((string= x "??") 'match-segment?)
        (t fail)))

(defun variable-p (sym)
  (and (symbolp sym)
       (equal (char (symbol-name sym) 0) #\?)))

(defun starts-with (seq sym)
  (and (consp seq)
       (string= (first seq) sym)))

(defun segment-pattern-p (pattern)
  (and (consp pattern) (consp (first pattern))
       (symbolp (first (first pattern)))
       (match-segment-fn (string (first (first pattern))))))

(defun match-segment-fn (x)
  (when (stringp x)
    ;; (get x 'match-segment)
    (symbol-index x)))

(defun match-segmenter (pattern input bindings)
  (funcall (match-segment-fn (string (first (first pattern))))
           pattern input bindings))

(defun match-segment? (pattern input bindings)
  (let ((var-and-guard (rest (first pattern)))
        (pat (rest pattern)))
    (or (match var-and-guard input bindings)
        (match pat input bindings))))

(defun lookup-bindings (key alist)
  (assoc key alist))

(defun extend-bindings (key val  alist)
  (acons key val alist))

(defun match-var (pattern input bindings)
  (if (lookup-bindings pattern bindings)
      bindings
      (extend-bindings pattern input bindings)))

(defun match-segment (pattern input bindings &optional (start 0))
  (let ((var (second (first pattern)))
        (pat (rest pattern)))
    (if (null pat)
        (match-var var input bindings)
        (let ((pos (position (second pattern) input :start start)))
          (if pos
              (match-var (second (first pattern))
                         (subseq input 0 pos)
                         bindings)
              (let ((b2 (match (rest pattern) (rest input) bindings)))
                (if b2
                    (union b2
                          (match-var (second (first pattern)) (first input) bindings))
                    fail)))))))

(defun match (pattern input &optional (bindings no-bindings))
  (cond ((eq bindings fail) fail)
        ((variable-p pattern) (match-var pattern input bindings))
        ((segment-pattern-p pattern) (match-segmenter pattern input bindings))
        ((eql pattern input) bindings)
        ((and (consp pattern)
              (consp input)) (match (rest pattern) (rest input)
                                    (match (first pattern) (first input) bindings)))
        (t fail)))

(defun split (delimiter collector seq)
  "Split the given string on the delimiter(s)"
  (loop for x = 0 then (1+ y)
       as y = (position delimiter seq :start x)
       collect (funcall collector x y)
       while y))
