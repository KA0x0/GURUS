;;; sh.el --- Configures shells -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(use-package vterm)

(use-package eshell-syntax-highlighting
  :after eshell-mode
  :config
  ;; Enable in all Eshell buffers.
  (eshell-syntax-highlighting-global-mode +1))


(provide 'my-sh)

;;; sh.el ends here
