;;; armstrong-numbers.el --- armstrong-numbers Exercise (exercism)

;;; Commentary:

;;; Code:
(defun number-of-digits (n)
  "Return the number of digits of integer N."
  (1+ (truncate (log n 10))))

(defun nth-digit (x n)
  "Extract the (N-1)-th digit of integer X.
See here for the formula: https://en.wikipedia.org/wiki/Narcissistic_number"
  (/ (- (mod x (expt 10 (1+ n))) (mod x (expt 10 n))) (expt 10 n)))

(defun armstrong-p (n)
  "Tell whether N is an Armstrong number or not."
  (let
      ;; VARLIST:
      ((ndigits (number-of-digits n))
       (somme 0))
    ;; BODY:
    (dotimes (i ndigits somme)
      (setq somme (+ somme (expt (nth-digit n i) ndigits))))
    (if (= somme n)
	t
      nil)))

(provide 'armstrong-numbers)
;;; armstrong-numbers.el ends here
