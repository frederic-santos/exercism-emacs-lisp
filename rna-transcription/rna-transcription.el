;;; rna-transcription.el -- RNA Transcription (exercism)

;;; Commentary:
;;; `rna-nucleotide' is used to convert every single nucleotide of a DNA strand.
;;; `to-rna' converts a whole DNA strand.

;;; Code:
(defun rna-nucleotide (char)
  "Convert one single DNA nucleotide into its RNA complement.
CHAR must be a character, i.e. an integer.
This function also checks for validity of CHAR."
  (cond ((= char ?A)
         ?U)
        ((= char ?T)
         ?A)
        ((= char ?C)
         ?G)
        ((= char ?G)
         ?C)
        (t                              ; in all other cases
         (error "Invalid nucleotide"))))

(defun to-rna (dna-strand)
  "Convert a DNA strand into its RNA complement.
DNA-STRAND must be a string."
  (concat (mapcar 'rna-nucleotide dna-strand)))

(provide 'rna-transcription)
;;; rna-transcription.el ends here
