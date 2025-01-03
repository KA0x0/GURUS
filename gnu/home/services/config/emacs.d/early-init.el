;;; early-init.el --- Loads important early elisp -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'server)
(unless (server-running-p)
  (server-start))

;; Startup speed, annoyance suppression
(setq byte-compile-warnings '(not obsolete))
(setq warning-suppress-log-types '((comp) (bytecomp)))
(setq native-comp-async-report-warnings-errors 'silent)

(provide 'early-init)

;;; early-init.el ends here
