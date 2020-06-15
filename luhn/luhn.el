;;; luhn.el --- Luhn exercise (exercism)

;;; Commentary:
;;; Second (hopefully) improved version.
;;; There are four functions:
;;; 1. `valid-input-p' ensures checks, and returns the string without spaces
;;;     if it is valid.  Might be rewritten with a regexp instead of ugly checks?..
;;; 2. `transform-digit' only transforms a given *digit* in Luhn algo.
;;; 3. `test-luhn' tests a whole *number*, but this number must be valid.
;;; 4. `luhn-p' is the main function.

;;; Code:

(defun valid-input-p (n)
  "Check whether a string N is a valid input for `luhn-p'.
If it is not valid, return nil.
If it is valid, return N without potential spaces."
  (let ((n-without-spaces
	 (replace-regexp-in-string " " "" n))) ; remove spaces in N
    (if (string-match-p "[^0-9]" n-without-spaces)  ; are there characters outside of [0-9]?
	(error "There are forbidden characters in n")
      (unless (<= (length n-without-spaces) 1) ; empty string or isolated character
	n-without-spaces))))

(defun transform-digit (digit)
  "Transformation for a DIGIT in Luhn algo.
If 2*DIGIT <= 9, return 2*DIGIT.
Otherwise, return 2*DIGIT - 9."
  (let ((double (* digit 2)))
    (if (<= double 9)
	double
      (- double 9))))

(defun test-luhn (number)
  "Test a (valid) NUMBER with Luhn algorithm.
Return t if the sum of the transformed digits of NUMBER is evenly divisible by 10.
No spaces are allowed (there are supposed to be removed with `valid-input-p')."
  (let ((sum 0)				; sum of transformed digits
	(digits (mapcar 'string (reverse number))) ; list of digits (as strings, not characters) in NUMBER
	(counter 1)) ; will indicate if a given digit should be kept as-is or transformed
    (dolist (digit digits)
      (setq sum (+ sum			; increment sum with
		   (if (= (mod counter 2) 0)
		       (transform-digit (string-to-number digit)) ; transformed number
		     (string-to-number digit)))) ; current digit kept as-is
      (setq counter (1+ counter)))	; increment counter
    (zerop (mod sum 10))))		; return t if sum = 0 mod 10

(defun luhn-p (n)
  "Check whether string N is valid per Luhn formula."
  (let ((is-valid (valid-input-p n)))
    (and is-valid
	 (test-luhn is-valid))))

(provide 'luhn)
;;; luhn.el ends here
