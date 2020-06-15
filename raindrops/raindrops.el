;;; raindrops.el --- Raindrops (exercism)

;;; Commentary:

;;; Code:

(require 'cl-lib)

(defun convert (n)
  "Convert integer N to its raindrops string."
  (let ((result (concat
		 (when (= (mod n 3) 0) "Pling")
		 (when (= (mod n 5) 0) "Plang")
		 (when (= (mod n 7) 0) "Plong"))))
    ;; Return final result:
    (if (equal result "")			; if non empty
	(number-to-string n)
      result)))

(provide 'raindrops)
;;; raindrops.el ends here
