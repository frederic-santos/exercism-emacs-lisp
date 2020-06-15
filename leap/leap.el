;;; leap.el --- Leap exercise (exercism)

;;; Commentary: First version that simply works (but might not be elegant).

;;; Code:
(defun leap-year-p (n)
  "Return t if year N is a leap year."
  (let ((factor4 (mod n 4))
	(factor100 (mod n 100))
	(factor400 (mod n 400)))
    (when (or (= factor400 0)
	      (and (= factor4 0)
		   (> factor100 0)))
	   t)))

(provide 'leap-year-p)
;;; leap.el ends here
