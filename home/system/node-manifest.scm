;; This "manifest" file can be passed to 'guix package -m' to reproduce
;; the content of your profile.  This is "symbolic": it only specifies
;; package names.  To reproduce the exact same profile, you also need to
;; capture the channels being used, as returned by "guix describe".
;; See the "Replicating Guix" section in the manual.

;;; Code:

(specifications->manifest
  (list "age"
        "calibre"
        "podman"
        "qemu"
        "sshfs"
        "transmission@4.0.5"
        "tpm2-tss"))

;;; node1-manifest.scm ends here
