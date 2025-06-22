;;; lisp.el --- Provide Lisp related features -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(use-package eglot)

(use-package prism)

(add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1)))

(use-package elisp-autofmt
  :commands (elisp-autofmt-mode elisp-autofmt-buffer)
  :hook (emacs-lisp-mode . elisp-autofmt-mode))

(use-package geiser-guile
  (setopt guix-geiser-connection-timeout (* 1000 60 16)))


(provide 'my-list)

;;; lisp.el ends here
