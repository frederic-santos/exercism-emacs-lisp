;;; grains.el --- Grains exercise (exercism)

;;; Commentary:
;;; Reminder: Emacs can only handle integers < 2^61 - 1.
;;; Thus, in `square' function, 2 must be indicated as a float,
;;; otherwise (square n) would fail for n>=62.

;;; Code:

(defun square (n)
  "Return the number of grains on square N."
  (expt 2.0 (1- n)))

(defun total ()
  "Calculate the total number of grains on the chessboard."
  (let ((sum 0)
        (square-number 1))
    (dotimes (square-number 64 sum)
      (setq sum (+ sum (square (1+ square-number)))))))

(provide 'grains)
;;; grains.el ends here
