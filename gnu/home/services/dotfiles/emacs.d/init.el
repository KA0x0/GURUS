;; Startup
;; UI 
(menu-bar-mode 0)
(tool-bar-mode 0)
(blink-cursor-mode 0)
(column-number-mode 1)

(setq-default inhibit-startup-screen 1)
;; Show stray whitespace
(setq-default show-trailing-whitespace t)
(setq-default indicate-empty-lines t)
(setq-default indicate-buffer-boundaries 'left)
;; Add a newline automatically at the end of a file while saving
(setq-default require-final-newline t)
;; Consider a period followed by a single space to be end of sentence
(setq-default sentence-end-double-space nil)
;; Use spaces, not tabs, for indentation
(setq-default indent-tabs-mode nil)
;; Highlight matching pairs of parentheses
(setq-default show-paren-delay 0)
(show-paren-mode 1)
;; Write auto-saves and backups to separate directory
(make-directory "~/.tmp/emacs/auto-save/" t)
(setq-default auto-save-file-name-transforms '((".*" "~/.tmp/emacs/auto-save/" t)))
(setq-default backup-directory-alist '(("." . "~/.tmp/emacs/backup/")))
;; Do not move the current file while creating backup
(setq-default backup-by-copying t)
;; Lockfiles
(setq-default create-lockfiles nil) ;; Disable lockfiles
;; Electric Pair
(electric-pair-mode 1) ;; Enable Electric-Pair-mode
(setq-default electric-pair-delete-adjacent-pairs 1)
;; Eshell
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

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :init
  (savehist-mode))

;; Mouse scrolling in terminal emacs
(unless (display-graphic-p)
  ;; activate mouse-based scrolling
  (xterm-mouse-mode 1)
  (global-set-key (kbd "<mouse-4>") 'scroll-down-line)
  (global-set-key (kbd "<mouse-5>") 'scroll-up-line))

;; A few more useful configurations...
(use-package emacs
  :init
  ;; Add prompt indicator to `completing-read-multiple'.
  ;; We display [CRM<separator>], e.g., [CRM,] if the separator is a comma.
  (defun crm-indicator (args)
    (cons (format "[CRM%s] %s"
                  (replace-regexp-in-string
                   "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
                   crm-separator)
                  (car args))
          (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  ;; Support opening new minibuffers from inside existing minibuffers.
  (setq enable-recursive-minibuffers t)

  ;; Emacs 28 and newer: Hide commands in M-x which do not work in the current
  ;; mode.  Vertico commands are hidden in normal buffers. This setting is
  ;; useful beyond Vertico.
  (setq read-extended-command-predicate #'command-completion-default-include-p))

(use-package flycheck
:config
(add-hook 'after-init-hook #'global-flycheck-mode))

(add-to-list 'load-path (expand-file-name "dev-phone-init.el"))

(use-package geiser-guile)

(provide 'init)

;;; init.el ends here
