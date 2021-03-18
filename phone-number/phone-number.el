;;; phone-number.el --- phone-number Exercise (exercism)

;;; Commentary:
;;; I think my pprint function is ugly :-) and might be improved somehow.

;;; Code:
(defun numbers (s)
  "Clean string S by removing all punctuation, and country code.
S is supposed to be a phone number and thus must contain digits.
To be valid, its country code (if present) must be 1.
Also, the phone number itself must have 10 digits."
  (let* ((cleaned-number (replace-regexp-in-string
                          "[[:punct:][:space:]]" "" s))
         (first-digit (substring cleaned-number 0 1))
         (length-number (length cleaned-number)))
    (cond ((= length-number 10)         ; already clean!
           cleaned-number)
          ((and (= length-number 11)    ; must remove country code
                (string-equal first-digit "1"))
           (substring cleaned-number 1))
          (t                            ; all other cases are incorrect
           "0000000000"))))

(defun area-code (s)
  "Return area code of the phone number S."
  (substring (numbers s) 0 3))

(defun pprint (s)
  "Pretty-print the phone number S."
  (let ((cleaned-s (numbers s)))
    (concat "("
            (area-code cleaned-s)
            ") "
            (substring cleaned-s 3 6)
            "-"
            (substring cleaned-s 6))))

(provide 'phone-number)
;;; phone-number.el ends here
