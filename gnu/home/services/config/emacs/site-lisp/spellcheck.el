;;; spellcheck.el --- Spell Checking -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(use-package jinx
  :hook (emacs-startup . global-jinx-mode))

(provide 'my-spellcheck)

;; my-spellcheck.el ends here
