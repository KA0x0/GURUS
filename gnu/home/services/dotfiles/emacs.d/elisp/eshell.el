;;; eshell.el --- Configures eshell -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(use-package eshell-syntax-highlighting
  :after eshell-mode
  :config
  ;; Enable in all Eshell buffers.
  (eshell-syntax-highlighting-global-mode +1))

(with-eval-after-load "esh-opt"
  (require 'virtualenvwrapper)
  (venv-initialize-eshell)
  (autoload 'epe-theme-lambda "eshell-prompt-extras")
  (setq eshell-highlight-prompt nil
        eshell-prompt-function 'epe-theme-lambda))

(use-package pcmpl-args)


(provide 'my-eshell)

;;; eshell.el ends here
