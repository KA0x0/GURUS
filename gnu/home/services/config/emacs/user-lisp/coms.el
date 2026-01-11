;;; coms.el --- Messaging clients configurations -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(mu4e-alert-set-default-style 'notifications)
(add-hook 'after-init-hook #'mu4e-alert-enable-notifications)
(add-hook 'after-init-hook #'mu4e-alert-enable-mode-line-display)

(use-package ement)


(provide 'my-coms)

;;; coms.el ends here
