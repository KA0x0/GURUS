;;; init.el --- Loads more lisp module -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(use-package compat)

(dolist (f(directory-files "~/.config/emacs/site-lisp" t "\\.el$")) (load-file))

(provide 'init)

;;; init.el ends here
