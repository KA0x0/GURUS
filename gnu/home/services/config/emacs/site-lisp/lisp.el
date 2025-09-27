;;; lisp.el --- Provide Lisp related features -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(use-package eglot)

(use-package prism)

(use-package lispy
  :hook (emacs-lisp-mode . lispy-mode))

(defun my/format-elisp-buffer ()) ;; autofmt on save

(provide 'my-lisp)

;;; lisp.el ends here
