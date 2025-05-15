;;; lisp.el --- Provide Lisp related features -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(use-package eglot)

(add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1)))

(provide 'my-list)

;;; lisp.el ends here
