;;; dev.el --- Provide development related features -*- lexical-binding: t; -*-

;;; Commentary: Small development related packages that do not belong in a file

;;; Code:

(use-package exec-path-from-shell
:init
  (exec-path-from-shell-initialize))

(use-package polymode)

(use-package graphviz-dot-mode)


(provide 'my-dev)

;;; dev.el ends here
