;;; lisp.el --- Provide Lisp related features -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(use-package eglot)
(use-package geiser)
(use-package prism)

(setopt guix-geiser-connection-timeout (* 1000 60 30)) ;; 30 mins

(use-package lispy
  :hook (emacs-lisp-mode . lispy-mode))

(use-package flymake-guile
  :hook (scheme-mode-hook . flymake-guile))

(provide 'my-lisp)

;;; lisp.el ends here
