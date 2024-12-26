;;; init.el --- Default config files, load lisp module -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(dolist (f(directory-files "~/.emacs.d/lisp" t)) (load-file))

(provide 'init)

;;; init.el ends here
