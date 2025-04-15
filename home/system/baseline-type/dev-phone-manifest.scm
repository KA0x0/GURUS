;; This "manifest" file can be passed to 'guix package -m' to reproduce
;; the content of your profile.  This is "symbolic": it only specifies
;; package names.  To reproduce the exact same profile, you also need to
;; capture the channels being used, as returned by "guix describe".
;; See the "Replicating Guix" section in the manual.

;;; Code:

(specifications->manifest
  (list "adb"
        "aflplusplus"
        "ascii"
        "awscli-2"
        "binutils"
        "binwalk"
        "buildah"
        "curl-ssh"
        "diffoscope"
        "my-emacs-next"
        "guile-emacs"
        "emacs-bluetooth"
        "emacs-calibredb"
        "emacs-dape"
        "emacs-dired-preview"
        "emacs-disproject"
        "emacs-ednc"
        "emacs-ement"
        "emacs-emms"
        "emacs-forge"
        "emacs-git-timemachine"
        "emacs-mentor"
        "emacs-modbus"
        "emacs-org-caldav"
        "emacs-org-contacts"
        "emacs-org-timeblock"
        "emacs-org-ql"
        "emacs-verb"
        "emacs-world-time-mode"
        "emacs-x509-mode"
        "emacs-yasnippet"
     ;; "ffmpeg" propagated by mpv
        "file"
        "flashrom"
        "fontconfig"
        "font-google-noto-emoji"
        "font-iosevka-term-slab"
        "font-liberation"
        "font-wqy-zenhei"
        "freerdp"
        "gcc"
        "gdb"
        "gimp"
        "gnuradio"
        "go"
        "gopls"
        "delve" ;; go debugger
        "graphviz"
        "guile-aws"
        "imagemagick"
        "isync"
        "iw"
        "libfaketime"
        "llvm"
        "clang"
        "lldb"
        "man-pages"
        "mariadb"
        "monero"
        "mpd"
        "mpv"
        "mu"
        "mysql"
        "node"
        "openjdk"
        "openssh"
        "openvpn"
        "patch"
        "patchelf"
        "pinentry-emacs"
        "poke"
        "emacs-poke-mode"
        "pwntools"
        "python-debugpy"
        "python-ipython"
        "python-scapy"
        "qemu"
        "redis" ;; TODO:Migrate (Not free anymore) 
        "retroarch" "libretro-dolphin-emu" "libretro-mupen64plus-nx"
        "rr"
        "rust"
        "rust-analyzer"
        "sage"
        "emacs-sage-shell-mode"
        "sigrock-cli"
        "skopeo"
        "socat"
        "squashfs-tools"
        "sshfs"
        "tesseract-ocr"
        "tiled"
        "tree-sitter-c"
        "tree-sitter-cpp"
        "tree-sitter-dockerfile"
        "tree-sitter-go"
        "tree-sitter-javascript"
        "tree-sitter-org"
        "tree-sitter-php"
        "tree-sitter-rust"
        "unrar"
        "upx"
        "wl-clipboard"
        "wine64"
        "wireguard-tools"
        "wireshark"
        "yt-dlp"
        "zbar"))

;;; dev-phone-manifest.scm ends here
