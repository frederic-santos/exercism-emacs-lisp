;;; anagram.el --- Anagram (exercism)

;;; Commentary: I use the function `string-to-list' to convert
;;; a word into a list of characters (i.e., of integers).
;;; Two words are anagrams if their sorted list of characters
;;; are identical (but their original lists are not).

;;; Code:

(defun anagramp (word candidate)
  "Return t if CANDIDATE is an anagram of WORD.
This function is case-insensitive, i.e.,
'Tofu' is an anagram of 'Touf', and also of 'Ufot'.
However, a word is not an anagram of itself."
  (let ((list-word (string-to-list (downcase word)))
	(list-candidate (string-to-list (downcase candidate))))
    ;; Compare lists and sorted lists of characters:
    (and (not (equal list-word list-candidate)) ; word is not equal to candidate
	 (equal (sort list-word '<) (sort list-candidate '<))))) ; but has same letters

(defun anagrams-for (word candidates)
  "Find all anagrams of WORD among a list of CANDIDATES."
  (let ((list-of-anagrams ()))
    (dolist (candidate candidates)
      (when (anagramp word candidate)
	(push candidate list-of-anagrams)))
    ;; Return all possible anagrams (nreverse preserves their original order):
    (nreverse list-of-anagrams)))	; N.B.: nreverse is destructive.

(provide 'anagram)
;;; anagram.el ends here
