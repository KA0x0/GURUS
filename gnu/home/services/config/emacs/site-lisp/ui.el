;;; ui.el --- Provide basic UI -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(setopt 
  inhibit-startup-screen t
  show-trailing-whitespace t
  indicate-empty-lines t
  indicate-buffer-boundaries 'left
  require-final-newline t
  sentence-end-double-space nil ;; Consider a period followed by a single space to be end of sentence
  indent-tabs-mode nil ;; ;; Use spaces, not tabs, for indentation
  show-paren-delay 0
  setopt auto-save-file-name-transforms '((".*" "~/.tmp/emacs/auto-save/" t))
  backup-directory-alist '(("." . "~/.tmp/emacs/backup/"))
  backup-by-copying t ;; Do not move the current file while creating backup
;; Lockfiles
  setopt create-lockfiles nil
;; Scratch Buffer
  setopt initial-scratch-message "")

(menu-bar-mode 0)
(tool-bar-mode 0)
(blink-cursor-mode 0)
(column-number-mode t)

(show-paren-mode t)
(make-directory (expand-file-name ".tmp/emacs/auto-save/" (getenv "HOME")) t)

(winner-mode t)

(electric-pair-mode t
  setopt electric-pair-delete-adjacent-pairs t)

;; Allow for shorter responses: "y" for yes and "n" for no.
(fset 'yes-or-no-p 'y-or-n-p)

(use-package repeat
  :config
  (repeat-mode))

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :init
  (savehist-mode))

;; Number of lines to scroll with mouse
(setopt mouse-wheel-scroll-amount '(12))
;; Scroll window under mouse
(setopt mouse-wheel-follow-mouse 't)

;; Mouse scrolling in terminal emacs
(unless (display-graphic-p)
  ;; activate mouse-based scrolling
  (xterm-mouse-mode t)
  (global-set-key (kbd "<mouse-4>") 'scroll-down-line)
  (global-set-key (kbd "<mouse-5>") 'scroll-up-line))

(use-package inheritenv)

(use-package exec-path-from-shell
:init
  (exec-path-from-shell-initialize))

(setopt guix-geiser-connection-timeout (* 1000 60 30)) ;; 30 mins

(use-package diff-hl
  :config
  (global-diff-hl-mode))


(provide 'my-ui)

;; my-ui.el ends here
