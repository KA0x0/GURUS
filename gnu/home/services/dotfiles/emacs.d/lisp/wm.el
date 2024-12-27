;;; wm.el --- Provide features usefull on a full display -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

;; Theme
(load-theme 'modus-vivendi)

;; Fonts
(set-frame-font "iosevka 12" nil t)

(defun shrug ()
  "insert /shrug ascii at point"
	  (interactive)
	  (insert "¯\_(ツ)_/¯"))

(defun tableflip ()
  "insert /tableflip ascii at point"
	  (interactive)
	  (insert "(╯° °）╯︵ ┻━┻"))

(hyperbole-mode 1)

(use-package yasnippet)


(provide 'my-wm)

;;; wm.el ends here
