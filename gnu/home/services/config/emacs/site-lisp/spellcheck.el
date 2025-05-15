;;; spellcheck.el --- Provide Spell Checking -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(use-package jinx
  :hook (emacs-startup . global-jinx-mode))

(provide 'my-spellcheck)

;; spellcheck.el ends here
