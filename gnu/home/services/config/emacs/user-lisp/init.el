;;; init.el --- Loads more lisp module -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(use-package compat)

(setopt guix-geiser-connection-timeout (* 1000 60 30)) ;; 30 mins

(provide 'init)

;;; init.el ends here
