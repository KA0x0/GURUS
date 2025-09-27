;;; lisp.el --- Provide Lisp related features -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(use-package eglot)

(use-package prism)

(add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1)))

(provide 'my-lisp)

;;; lisp.el ends here
