;; This "manifest" file can be passed to 'guix package -m' to reproduce
;; the content of your profile.  This is "symbolic": it only specifies
;; package names.  To reproduce the exact same profile, you also need to
;; capture the channels being used, as returned by "guix describe".
;; See the "Replicating Guix" section in the manual.

(specifications->manifest
  (list "awscli"
        "emacs-bluetooth"
        "ccid"
        "curl"
        "diffoscope"
        "direnv"
        "docker"
        "emacs-docker"
        "docker-compose"
        "emacs-next-gcc"
        "emacs-envrc"
        "emacs-emms"
        "emacs-exiftool"
        "emacs-jabber"
        "emacs-mentor"
        "emacs-modus-themes"
        "emacs-notmuch"
        "emacs-restclient"
        "emacs-ob-restclient"
        "ffmpeg"
        "file"
        "font-fira-code"
        "freerdp"
        "gdb"
        "google-cloud-sdk"
        "guile-aws"
        "mktorrent"
        "mpd"
        "mpv"
        "openssh"
        "openvpn"
        "emacs-powershell"
        "socat"
        "sshfs"
        "tesseract-ocr"
        "tiled"
        "wireguard-tools"
        "yt-dlp"))

;;; dev-phone-manifest.scm ends here
