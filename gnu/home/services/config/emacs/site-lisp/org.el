;;; org.el --- Org configurations -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(use-package denote
  :config
  ;; Accept any symbol in a .dir-locals.el file; makes it easier to use silos.
  ;; See "silos" in the manual: https://protesilaos.com/emacs/denote
  (put 'denote-file-type 'safe-local-variable-p 'symbolp))

(with-eval-after-load 'org (global-org-modern-mode))


(provide 'my-org)

;;; org.el ends here
