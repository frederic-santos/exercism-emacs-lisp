;;; hamming.el --- Hamming (exercism)

;;; Commentary:
;;; Second version with improved indentation and variable naming.

;;; Code:

(defun hamming-distance (s1 s2)
  "Compute Hamming Distance between two DNA sequences S1 and S2.
S1 and S2 must be strings and have the same length."
  (let ((sum 0)
        (chars-in-s1 (string-to-list s1))
        (chars-in-s2 (string-to-list s2)))
    (unless (= (length s1) (length s2))
      (error "Lists s1 and s2 must have the same length"))
    (while chars-in-s1
      ;; Compare CARs of both lists, and shorten them *at the same time*:
      (unless (= (pop chars-in-s1) (pop chars-in-s2))
        (setq sum (1+ sum))))
    sum))

(provide 'hamming)
;;; hamming.el ends here
