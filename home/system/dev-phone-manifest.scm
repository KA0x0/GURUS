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
        "emacs-next-gcc"
        "emacs-dirvish"
        "emacs-envrc"
        "emacs-emms"
        "emacs-exiftool"
        "emacs-jabber"
        "emacs-mentor"
        "emacs-modus-themes"
        "emacs-notmuch"
        "emacs-restclient"
        "emacs-ob-restclient"
        "fd"
        "ffmpeg"
        "ffmpegthumbnailer"
        "file"
        "font-fira-code"
        "freerdp"
        "gdb"
        "google-cloud-sdk"
        "guile-aws"
        "guile-ssh"
        "mediainfo"
        "mktorrent"
        "mpd"
        "mpv"
        "openssh"
        "openvpn"
        "podman"
        "emacs-powershell"
        "pwntools"
        "qemu"
        "ripgrep"
        "socat"
        "sshfs"
        "tesseract-ocr"
        "tiled"
        "wireguard-tools"
        "yt-dlp"))

;;; dev-phone-manifest.scm ends here
