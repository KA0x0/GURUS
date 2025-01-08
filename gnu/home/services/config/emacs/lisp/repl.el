;;; repl.el --- Configures different REPL -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(use-package eshell-syntax-highlighting
  :after eshell-mode
  :config
  ;; Enable in all Eshell buffers.
  (eshell-syntax-highlighting-global-mode +1))


(provide 'my-repl)

;;; repl.el ends here
