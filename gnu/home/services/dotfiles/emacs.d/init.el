;;; init.el --- Loads more lisp module -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'compat)

(dolist (f(directory-files "~/.emacs.d/lisp" t "\\.el$")) (load-file))

(provide 'init)

;;; init.el ends here
