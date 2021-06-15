;;; nucleotide-count.el --- nucleotide-count Exercise (exercism)

;;; Code:
(require 'cl) ; needed for function `count' below

(defconst nucleotides '(?A ?C ?G ?T)
  "List of all possible nucleotides (as characters).")

(defun invalid-strand-p (dna)
  "Check whether there are other chars in string DNA than A, C, G and T.
If the DNA strand is valid, no error is thrown and nil is returned."
  (if (string-match-p "[^ACGT]" dna)
      (error "There should be only A, C, G and T characters")))

(defun count-occurrences (nucleo strand)
  "Count number of times char NUCLEO appears in string STRAND."
  (count nucleo (string-to-list strand)))

(defun nucleotide-count (dna)
  "Count the number of each nucleotide in a DNA sequence."
  (unless (invalid-strand-p dna)
    (mapcar (lambda (nucleo)
              (cons nucleo (count-occurrences nucleo dna)))
            nucleotides)))
    
(provide 'nucleotide-count)
;;; nucleotide-count.el ends here
