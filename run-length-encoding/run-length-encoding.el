;;; run-length-encoding.el --- run-length-encoding Exercise (exercism)

;;; Commentary:

;;; Helpers:
(defun string-repeat (x n)
  "Repeat string X N times."
  (let ((result nil))
    (dotimes (i n result)
      (setq result (concat x result)))))

(defun letter-or-whitespace-p (char)
  "Test whether charcater CHAR is a letter.
Return t if CHAR is within [A-Z] or [a-z]."
  (let ((c (char-to-string char)))
    (or (string-match "[[:alpha:]]" c)
        (string-match "[[:space:]]" c))))

;;; Code:
(defun run-length-encode (s)
  "Encode the string S according to the RLE algorithm."
  (let* ((chars (string-to-list s))
         (current-char (car chars))
         (counter 1)           ; number of occurrences of current-char
         (result ""))          ; final string to be returned
    (while chars               ; while not empty
      ;; Make the list of characters shorter:
      (setq chars (cdr chars))
      (if (equal (car chars) current-char)
          ;; If we hit the same character:
          (setq counter (1+ counter))   ; simply update the counter
        ;; If we hit a different character:
        (setq result (concat result
                             (when (> counter 1)
                               (number-to-string counter))
                             (char-to-string current-char)))
        (setq counter 1)
        (setq current-char (car chars))))
    result))

(defun run-length-decode (c)
  "Decode the RLE-encoded string C."
  (let* ((result "")
         (chars (string-to-list c))
         (current-char "")
         (occur ""))
    (while chars                        ; while not empty
      ;; Update current-char and shorten chars list *at the same time*:
      (setq current-char (pop chars))
      (if (not (letter-or-whitespace-p current-char))
          (setq occur (concat occur
                              (char-to-string current-char)))
        ;; else, current-char is a letter:
        (setq result (concat result
                             (string-repeat (char-to-string current-char)
                                    (max (string-to-number occur) 1))))
        (setq occur "")))
    result))

(provide 'run-length-encoding)
;;; run-length-encoding.el ends here
