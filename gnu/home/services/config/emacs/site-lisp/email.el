;;; email.el --- Email configurations -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(mu4e-alert-set-default-style 'notifications)
(add-hook 'after-init-hook #'mu4e-alert-enable-notifications)
(add-hook 'after-init-hook #'mu4e-alert-enable-mode-line-display)


(provide 'my-email)

;;; email.el ends here
