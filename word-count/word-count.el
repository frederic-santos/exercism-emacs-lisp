;;; word-count.el --- word-count Exercise (exercism)

;;; Commentary:
;;; `word--do-count' fills in an alist of words and counts.
;;; Words are the keys, counts are the values.
;;; It proceeds recursively, as follows:
;;; (i) Consider the CAR of the remaining words list
;;; (ii) If this is the first occurrence of this word so far,
;;; its associated value in the table will be nil.  Thus, create
;;; a new cons cell in this alist, with a count equal to 1.
;;; Otherwise, increment the counter of the word in the table.
;;; (iii) Repeat the procedure on the CDR of the words list,
;;; until this list is empty.

;;; Code:
(defun word--do-count (words counts)
  "Return the COUNTS of each word in a list of WORDS.
The value returned is an alist, the WORDS being the keys,
and the COUNTS being their associated values."
  (let* ((word (car words))
         (count (assoc word counts)))
    (if word                            ; the list is not empty
        (word--do-count (cdr words)
                        (if (not count) ; the current word is new
                            (cons (cons word 1)
                                  counts)
                          (setcdr (assoc word counts)
                                  (1+ (alist-get word counts nil nil 'equal)))
                          counts))
      ;; else, the list is empty: return final alist
      counts)))
  
(defun word-count (phrase)
  "Return the occurrences of each word in a PHRASE.
PHRASE is `downcase'd upstream.
Numbers are counted, but not punctuation marks.
If PHRASE is the empty string, return nil.
Otherwise, return an alist of words and their counts."
  (unless (equal phrase "")
    (let ((downcased-words (split-string
                            (downcase phrase)
                            "[^1-9a-z]"
                            t)))
      (word--do-count downcased-words nil))))

(provide 'word-count)
;;; word-count.el ends here
