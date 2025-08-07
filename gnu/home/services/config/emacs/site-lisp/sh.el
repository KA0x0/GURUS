;;; sh.el --- Configures shells -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(use-package eshell-syntax-highlighting
  :after eshell-mode
  :config
  ;; Enable in all Eshell buffers.
  (eshell-syntax-highlighting-global-mode +1))

(use-package powershell)


(provide 'my-sh)

;;; sh.el ends here
