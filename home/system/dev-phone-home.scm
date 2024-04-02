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
               ("cue-split $1 $2" . "ffmpeg -i "$1" -f cue -i "$2" -c copy -map 0 -map_metadata 1 "%02d - $1"")))))))

;;; dev-phone-home.scm ends here
