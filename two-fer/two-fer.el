;;; two-fer.el --- Two-fer Exercise (exercism)

;;; Commentary:

;;; Code:
(defun two-fer (&optional name)
  "If NAME is 'Alice', return 'One for Alice, one for me.'.
If no NAME is given, return 'One for you, one for me.'"
  (concat "One for " (or name "you") ", one for me."))

(provide 'two-fer)
;;; two-fer.el ends here
