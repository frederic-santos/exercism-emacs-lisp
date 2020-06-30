;;; acronym.el --- Acronym (exercism)

;;; Commentary:

;;; Code:

(defun acronym (phrase)
  "Convert a PHRASE into its acronym."
  (let ((result (list (elt phrase 0)))
        (start-index 0))
    (while (string-match "[ -]+" phrase start-index)
      ;; Index where the next initial appears:
      (setq start-index (match-end 0))
      ;; Push this character into the list of initials:
      (push (capitalize (elt phrase start-index)) result))
    (apply 'string (reverse result))))

(provide 'acronym)
;;; acronym.el ends here
