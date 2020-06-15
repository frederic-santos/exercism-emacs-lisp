;;; difference-of-squares.el --- Difference of Squares (exercism)

;;; Code:

(defun square (x)
  "Compute the square value of X."
  (* x x))				; another solution: (expt x 2)

(defun square-of-sum (n)
  "Compute the squared sum of the N first integers (> 0)."
  (interactive "nNumber of values: ")
  (let
      ((liste (number-sequence 1 n)))
    (square (apply '+ liste))))

(defun sum-of-squares (n)
  "Compute the sum of the squared N first integers (> 0)."
  (interactive "nNumber of values: ")
  (let
      ((liste (number-sequence 1 n)))
    (apply '+ (mapcar 'square liste))))

(defun difference (n)
  "Compute difference between square of sum and sum of squares for the forst N integers."
  (interactive "nNumber of vaues: ")
  (- (square-of-sum n) (sum-of-squares n)))

(provide 'difference-of-squares)
;;; difference-of-squares.el ends here
