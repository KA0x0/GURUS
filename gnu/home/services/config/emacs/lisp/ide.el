;;; ide.el --- Provide IDE-like features -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(use-package eglot)

(use-package python-mode
  :hook
  (python-mode . eglot-ensure)  ; connect to language server when py-file is opened
  :custom
  (python-shell-interpreter "python3"))

(use-package geiser-guile)


(provide 'my-ide)

;;; ide.el ends here
