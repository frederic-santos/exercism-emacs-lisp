;;; bob.el --- Bob exercise (exercism)

;;; Commentary:

;;; Code:

(defun bob--has-words-or-digits-p (phrase)
  "Test whether PHRASE includes any word or digit.
If not, it is then an empty string, or maybe a sequence of spaces
and punctuation symbols."
  (string-match-p "[[:alnum:]]" phrase))

(defun bob--yell-p (phrase)
  "Test whether PHRASE consists in yelling at Bob, i.e. has capitals only.
All punctuation marks are allowed at the end of PHRASE,
but PHRASE must have words (and not only digits)."
  (and (string-match-p "[A-Z]" phrase)
       (string-equal phrase (upcase phrase))))

(defun bob--question-p (phrase)
  "Test whether PHRASE is a question for Bob.
I.e., it must end by '?', maybe followed by some whitespaces.
Non-letters questions are allowed."
  (and (string-match-p "[[:ascii:]]" phrase) ; allow non-letter questions
       (string-match-p "?[[:space:]]*\\'" phrase)))

(defun bob--yell-question-p (phrase)
  "Test whether PHRASE consists in yelling a question to Bob."
  (and (bob--yell-p phrase)
       (bob--question-p phrase)))

(defun response-for (phrase)
  "Bob kindly answers to your PHRASE."
  (cond ((bob--yell-question-p phrase)
         "Calm down, I know what I'm doing!")
        ((bob--question-p phrase)
         "Sure.")
        ((bob--yell-p phrase)
         "Whoa, chill out!")
        ((bob--has-words-or-digits-p phrase)
         "Whatever.")
        (t                              ; anything else
         "Fine. Be that way!")))

(provide 'bob)
;;; bob.el ends here
