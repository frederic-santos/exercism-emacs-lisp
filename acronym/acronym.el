;;; acronym.el --- Acronym (exercism)

;;; Commentary:
;;; First try, probably not optimal. The function proceeds as follows:
;;; 1. Create a temp buffer and copy the phrase into it.
;;; 2. Initialize the result with the first letter of the phrase.
;;; 3. Add to the result the first (capitalized) letter of each word.
;;; 4. Reverse the string (since with `cons' the last word is first in the result).
;;; 5. Turn the list of characters (i.e., integers) into a string.

;;; Code:

(require 'cl-lib)

(defun acronym (phrase)
  "Convert a PHRASE into its acronym."
  (interactive "MEnter your phrase: ")
  (let
      ;; Initialize with first letter of the phrase:
      ((result (list (string-to-char phrase))))
    ;; Create a temp buffer:
    (with-temp-buffer
      ;; Put the phrase into the temp buffer:
      (insert phrase)
      (goto-char (point-min))
      ;; Loop until the end of buffer, or until there is no more word:
      (while (and (< (point) (point-max))
		  (re-search-forward "[ -]+" nil t))
	;; Add the first (capitalized) letter in the result:
	(setq result (cons
		      (capitalize
		       (string-to-char (substring phrase (1- (point)))))
		      result))))
    ;; Return result:
    (apply 'string (reverse result))))

(provide 'acronym)
;;; acronym.el ends here
