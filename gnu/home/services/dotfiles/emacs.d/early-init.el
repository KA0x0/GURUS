(require 'server)
(unless (server-running-p)
  (server-start))

;; Startup speed, annoyance suppression
(setq byte-compile-warnings '(not obsolete))
(setq warning-suppress-log-types '((comp) (bytecomp)))
(setq native-comp-async-report-warnings-errors 'silent)

;; Silence startup message
(setq inhibit-startup-echo-area-message (user-login-name))

;; Default frame configuration: full screen, good-looking title bar on macOS
(setq frame-resize-pixelwise t)
(tool-bar-mode -1) ; All these tools are in the menu-bar anyway
(setq default-frame-alist '((fullscreen . maximized)))

;; Turn off scroll bars
(vertical-scroll-bars . nil)
(horizontal-scroll-bars . nil)

;; Setting the face in here prevents flashes of
;; color as the theme gets activated
(background-color . "#000000")
(ns-appearance . dark)
(ns-transparent-titlebar . t)