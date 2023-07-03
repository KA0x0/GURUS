;; This "home-environment" file can be passed to 'guix home reconfigure'
;; to reproduce the content of your profile.  This is "symbolic": it only
;; specifies package names.  To reproduce the exact same profile, you also
;; need to capture the channels being used, as returned by "guix describe".
;; See the "Replicating Guix" section in the manual.

;;; Code:

(use-modules
  (gnu home) 
  (gnu home services) 
  (gnu home services shells) 
  (guix gexp) 
  (guix-package admin) 
  (gnu packages bash))

(home-environment
  (services
    (list (service home-bash-service-type
            (home-bash-configuration
              (aliases ;; use "\" to escape aliases.
               ("docker" . "podman")
               ("egrep" . "rg --engine auto --follow --smart-case")
               ("fgrep" . "rg --engine auto --fixed-strings --follow --smart-case")
               ("rg" . "rg --engine auto --follow --smart-case")
               ("strings" . "floss -v"))

;;; dev-home.scm ends here
