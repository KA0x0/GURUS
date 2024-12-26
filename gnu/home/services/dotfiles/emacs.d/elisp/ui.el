;;; ui.el --- Provide basic UI -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

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

;; Enable repeat mode for more ergonomic `dape' use
(use-package repeat
  :config
  (repeat-mode))

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


(provide 'ui-wm)

;; my-ui.el ends here