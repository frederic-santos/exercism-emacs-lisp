;;; acronym.el --- Acronym (exercism)

;;; Commentary:
;;; There is a repeated call (string-match "[ -]+" current-phrase)
;;; I've (not yet) found a way to avoid this.

;;; Code:

(defun acronym (phrase)
  "Convert a PHRASE into its acronym."
  (let* ((current-phrase phrase)
         (initial (string-to-char current-phrase))
         (result (list initial)))
    (while (string-match "[ -]+" current-phrase)
      ;; Search for the next initial (which follows a whitespace):
      (setq initial (1+ (string-match "[ -]+" current-phrase)))
      ;; Add this to the list of initials:
      (setq result (cons (capitalize (elt current-phrase initial)) result))
      ;; Shorten the current phrase:
      (setq current-phrase (substring current-phrase initial)))
    (apply 'string (reverse result))))

(provide 'acronym)
;;; acronym.el ends here
