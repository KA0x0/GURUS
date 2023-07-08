(define guix-early-init.el
 "\
;; This file is NOT part of GNU Emacs.

;; GNU Emacs is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <https://www.gnu.org/licenses/>.

;;; Code:

(require 'server)
(unless (server-running-p)
  (server-start))

;;; early-init.el ends here\n
")


(define guix-init.el
 "\
;; This file is NOT part of GNU Emacs.

;; GNU Emacs is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <https://www.gnu.org/licenses/>.

;;; Code:

;; UI:
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(blink-cursor-mode -1)
(column-number-mode)

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

;; Disable lockfiles.
(setq-default create-lockfiles nil)

;; Enable Paredit.
(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook 'enable-paredit-mode)
(add-hook 'ielm-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-mode-hook 'enable-paredit-mode)

;; Eshell
(use-package eshell-syntax-highlighting
  :after eshell-mode
  :config
  ;; Enable in all Eshell buffers.
  (eshell-syntax-highlighting-global-mode +1))

(add-to-list 'load-path (expand-file-name "emacs-client.scm"))

;;; init.el ends here\n
")
