(define guix-early-init.el
  (require 'server)
  (unless (server-running-p)
    (server-start))

  ;; Startup speed, annoyance suppression
  (setq gc-cons-threshold 10000000)
  (setq byte-compile-warnings '(not obsolete))
  (setq warning-suppress-log-types '((comp) (bytecomp)))
  (setq native-comp-async-report-warnings-errors 'silent)

  ;; Silence startup message
  (setq inhibit-startup-echo-area-message (user-login-name))

  ;; Default frame configuration: full screen, good-looking title bar on macOS
  (setq frame-resize-pixelwise t)
  (tool-bar-mode -1) ; All these tools are in the menu-bar anyway
  (setq default-frame-alist '((fullscreen . maximized)

  ;; Turn off scroll bars
  (vertical-scroll-bars . nil)
  (horizontal-scroll-bars . nil)

  ;; Setting the face in here prevents flashes of
  ;; color as the theme gets activated
  (background-color . "#000000")
  (ns-appearance . dark)
  (ns-transparent-titlebar . t))))


(define guix-init.el
  ;; Startup:
  (setq-default set inhibit-startup-screen 1)

  ;; Interactively do things.
  (ido-mode 1)
  (ido-everywhere)
  (setq-default ido-enable-flex-matching t)
  (fido-mode)

  ;; Vi emulation
  (use-package meow)
  (meow-setup)
  (meow-global-mode 1)

  ;; Show stray whitespace.
  (setq-default show-trailing-whitespace t)
  (setq-default indicate-empty-lines t)
  (setq-default indicate-buffer-boundaries 'left)

  ;; Add a newline automatically at the end of a file while saving.
  (setq-default require-final-newline t)

  ;; Consider a period followed by a single space to be end of sentence.
  (setq-default sentence-end-double-space nil)

  ;; Use spaces, not tabs, for indentation.
  (setq-default indent-tabs-mode nil)

  ;; Highlight matching pairs of parentheses.
  (setq-default show-paren-delay 0)
  (show-paren-mode)

  ;; Write auto-saves and backups to separate directory.
  (make-directory "~/.tmp/emacs/auto-save/" t)
  (setq-default auto-save-file-name-transforms '((".*" "~/.tmp/emacs/auto-save/" t)))
  (setq-default backup-directory-alist '(("." . "~/.tmp/emacs/backup/")))

  ;; Do not move the current file while creating backup.
  (setq-default backup-by-copying t)

  ;; Lockfiles.
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

  (add-to-list 'load-path (expand-file-name "emacs-client.scm"))

  ;;; init.el ends here\n
)

(define emacs-full-client.el
  ;; Theme:
  (load-theme 'modus-vivendi)

  ;; UI:
  (menu-bar-mode -1)
  (toggle-scroll-bar -1)
  (tool-bar-mode -1)
  (blink-cursor-mode -1)
  (column-number-mode)

  ;; Fonts:
  (set-frame-font "fira code 12" nil t)
  ;; Enable the www ligature in every possible major mode
  (ligature-set-ligatures 't '("www"))

  ;; Enable ligatures in programming modes                                                           
  (ligature-set-ligatures 'prog-mode '("www" "**" "***" "**/" "*>" "*/" "\\\\" "\\\\\\" "{-" "::"
                                       ":::" ":=" "!!" "!=" "!==" "-}" "----" "-->" "->" "->>"
                                       "-<" "-<<" "-~" "#{" "#[" "##" "###" "####" "#(" "#?" "#_"
                                       "#_(" ".-" ".=" ".." "..<" "..." "?=" "??" ";;" "/*" "/**"
                                       "/=" "/==" "/>" "//" "///" "&&" "||" "||=" "|=" "|>" "^=" "$>"
                                       "++" "+++" "+>" "=:=" "==" "===" "==>" "=>" "=>>" "<="
                                       "=<<" "=/=" ">-" ">=" ">=>" ">>" ">>-" ">>=" ">>>" "<*"
                                       "<*>" "<|" "<|>" "<$" "<$>" "<!--" "<-" "<--" "<->" "<+"
                                       "<+>" "<=" "<==" "<=>" "<=<" "<>" "<<" "<<-" "<<=" "<<<"
                                       "<~" "<~~" "</" "</>" "~@" "~-" "~>" "~~" "~~>" "%%"))

  (global-ligature-mode 't)

  ;;; emacs-client.el ends here\n
)
