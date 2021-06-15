;;; nucleotide-count.el --- nucleotide-count Exercise (exercism)

;;; Commentary:
;;; The code works but is repetitive. It should be improved.

;;; Code:
(require 'cl) ; needed for function `count' below

(defun count-occurrences (char string)
  "Count number of times CHAR appears in a given STRING."
  (count (string-to-char char) (string-to-list string)))

(defun nucleotide-count (dna)
  "Count the number of each nucleotide in a DNA sequence."
  (let ((number-a (count-occurrences "A" dna))
        (number-c (count-occurrences "C" dna))
        (number-t (count-occurrences "T" dna))
        (number-g (count-occurrences "G" dna))
        (result '()))
    (if (= (apply '+ (list number-a number-c number-t number-g))
           (length dna))
        (progn
          (push (cons ?A number-a) result)
          (push (cons ?C number-c) result)
          (push (cons ?T number-t) result)
          (push (cons ?G number-g) result))
      (error "There should be only A, T, C and G characters"))))

(provide 'nucleotide-count)
;;; nucleotide-count.el ends here
