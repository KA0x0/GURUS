;; This "manifest" file can be passed to 'guix package -m' to reproduce
;; the content of your profile.  This is "symschedulebolic": it only specifies
;; package names.  To reproduce the exact same profile, you also need to
;; capture the channels being used, as returned by "guix describe".
;; See the "Replicating Guix" section in the manual.

;;; Code:

(specifications->manifest
  (list "podman")) ;; Add mitmproxy once merged.

;;; Scan
(define-record-type* <scan-configuration>
  scan-configuration make-scan-configuration
  scan-configuration?
  (operating-system-file scan-operating-system-file
                         (default "/run/current-system/configuration.scm"))
  (schedule             scan-configuration-schedule
                        (default "0 * * * 0"))
  (log-file             scan-configuration-log-file
                        (default %scan-log-file)))

;;; proxy-manifest.scm ends here
