;;; roman-numerals.el --- roman-numerals Exercise (exercism)

;;; Commentary:
;;; - First version (could probably be simplified a lot,and maybe
;;;   I did not come with the best algorithm :-))
;;; - I guess that there is an existing function for `paste', but
;;;   I could not find one...

;;; Code:

;;; Helpers:
(defun list-of-digits (n)
  "Return the digits of integer N as a list of numbers."
  (mapcar 'string-to-number
	  (mapcar 'string (number-to-string n))))

(defun prepare-number (n)
  "Prepare number N for conversion into roman numerals.
Check that N is in [1, 3000].
Transform N into a list of 4 digits (first ones may be 0).
E.g., return (0 2 3 5) for n = 235."
  (let ((n-digits (list-of-digits n)))
    (cond ((< n 1)
	   (error "n should be greater than 1"))
	  ((> n 3000)
	   (error "n should be smaller than 3000")))
    (while (< (length n-digits) 4)
      (push 0 n-digits))
    n-digits))

(defun paste (x n)
  "Repeat string X N times."
  (let ((result nil))
    (dotimes (i n result)
      (setq result (concat x result)))))

;;; Main function:
(defun to-roman (n)
  "Convert a number N into Roman Numerals.
This works for N <= 3000."
  (let ((roman '(("M" "" "")		; possible roman numerals per "place"
		 ("C" "D" "M")
		 ("X" "L" "C")
		 ("I" "V" "X")))
	(n-digits (prepare-number n))	; retrieve list of numbers in N
	(current-digit nil)		; digit considered at each loop iteration
	(current-numerals nil)		; possible roman num. for corresponding place
	(result ()))			; final roman numeral to be returned
    (while n-digits			; while not empty
      ;; Decrease length of both lists, and consider their CARs:
      (setq current-digit (pop n-digits))
      (setq current-numerals (pop roman))
      ;; Update result with the corresponding digit:
      (setq result
	    (concat result
		    (cond ((= current-digit 0) ; 0s must be simply skipped
			   "")
			  ((<= current-digit 3)
			   (paste (car current-numerals) current-digit))
			  ((= current-digit 4)
			   (concat (car current-numerals) (cadr current-numerals)))
			  ((= current-digit 5)
			   (cadr current-numerals))
			  ((= current-digit 6)
			   (concat (cadr current-numerals) (car current-numerals)))
			  ((< current-digit 9)
			   (concat (cadr current-numerals)
				   (paste (car current-numerals) (- current-digit 5))))
			  ((= current-digit 9)
			   (concat (car current-numerals) (caddr current-numerals)))))))
    result))

(provide 'roman-numerals)
;;; roman-numerals.el ends here
