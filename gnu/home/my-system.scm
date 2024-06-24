;;; GNU Guix --- Functional package management for GNU
;;;
;;; This file is NOT part of GNU Guix.
;;;
;;; This program is free software: you can redistribute it and/or modify
;;; it under the terms of the GNU General Public License as published by
;;; the Free Software Foundation, either version 3 of the License, or
;;; (at your option) any later version.
;;;
;;; This program is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Code:

(define-module (gnu my-system)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages file-systems)
  #:use-module (gnu packages gawk)
  #:use-module (gnu packages guile)
  #:use-module (gnu packages guile-xyz)
  #:use-module (gnu packages less)
  #:export (%my-base-operating-system)
  #:export (%my-base-packages)
  #:export (%my-base-services))

(define-public %my-base-operating-system
  (operating-system
   (locale "en_US.utf8")
   (timezone "Etc/Greenwich")
   (keyboard-layout (keyboard-layout "us" "ru"))))

(define-public %my-base-packages
  (map specification->package
  '("awscli-2"
    "bash"
    "bash-completion"
    "emacs-bash-completion"
    "bcachefs-tools"
    "bzip2"
    "chrony"
    "coreutils"
    "diffutils"
    "my-emacs-next-no-x"
    "emacs-async"
    "emacs-auto-compile"
    "emacs-cape"
    "emacs-consult"
    "emacs-consult-org-roam"
    "emacs-corfu"
    "emacs-eglot-x"
    "emacs-eshell-prompt-extras"
    "emacs-eshell-syntax-highlighting"
    "emacs-embark"
    "emacs-flycheck"
    "emacs-geiser"
    "emacs-geiser-guile"
    "emacs-guix"
    "emacs-logview"
    "emacs-magit"
    "emacs-marginalia"
    "emacs-orderless"
    "emacs-org"
    "emacs-org-roam"
    "emacs-pcmpl-args"
    "emacs-rainbow-delimiters"
    "emacs-transient"
    "emacs-undo-tree"
    "emacs-libvterm"
    "emacs-vertico"
    "eudev"
    "findutils"
    "gawk"
    "git"
    "grep"
    "guile-next"
    "guile-colorized"
    "guile-readline"
    "guile-ssh"
    "gzip"
    "inotify-tools"
    "iproute2"
    "kmod"
    "lzip"
    "man-db"
    "nftables"
    "nss-certs"
    "openssh-sans-x"
    "pinentry-tty"
    "emacs-pinentry"
    "procps"
    "polkit"
    "python-debug-sans-pip-wrapper"
    "rsync"
    "sed"
    "shadow"
    "sudo"
    "tar"
    "tree-sitter"
    "util-linux-with-udev"
    "wget"
    "which"
    "xz")))

(define-public %my-base-services
  (append
      (list (service my-dns)
            (service login-service-type my-motd)
            (service nftables-service-type)
            (service openssh-service-type
              (openssh-configuration
                (authorized-keys
                  ("ka0x" ,(local-file "ka0x.pub"))))))))

;;; my-system.scm ends here
