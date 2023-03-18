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

(define-module (gnu system)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cross-base)
  #:use-module (gnu packages cryptsetup)
  #:use-module (gnu packages disk)
  #:use-module (gnu packages file-systems)
  #:use-module (gnu packages gawk)
  #:use-module (gnu packages guile)
  #:use-module (gnu packages guile-xyz)
  #:use-module (gnu packages less)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages nvi)
  #:use-module (gnu packages package-management)
  #:use-module (gnu packages pciutils)
  #:use-module (gnu packages texinfo)
  #:use-module (gnu packages text-editors)
  #:use-module (gnu packages wget)
  #:export (%my-base-operating-system)
  #:export (%my-base-packages)
  #:export (%my-base-services))

(define-public %my-base-operating-system
  (operating-system
   (locale "en_US.utf8")
   (timezone "Etc/Greenwich")
   (keyboard-layout (keyboard-layout "us" "ru")))

(define-public %my-base-packages
  (map specification->package
  '("aws-vault"
    "bash"
    "bash-completion"
    "binutils"
    "emacs-bash-completion"
    "bcachefs-tools"
    "bzip2"
    "chrony"
    "coreutils"
    "curl"
    "diffutils"
    "my-emacs-next-no-x"
    "emacs-async"
    "emacs-auto-compile"
    "emacs-consult"
    "emacs-consult-eglot"
    "emacs-consult-not-much"
    "emacs-consult-org-roam"
    "emacs-corfu"
    "emacs-eglot"
    "emacs-eshell-syntax-highlighting"
    "emacs-embark"
    "emacs-flycheck"
    "emacs-geiser"
    "emacs-geiser-guile"
    "emacs-guix"
    "emacs-magit"
    "emacs-meow"
    "emacs-orderless"
    "emacs-org"
    "emacs-org-roam"
    "emacs-paredit"
    "emacs-rainbow-delimiters"
    "emacs-tramp"
    "emacs-undo-tree"
    "emacs-libvterm"
    "emacs-which-key"
    "eshell-prompt-extras"
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
    "kmod"
    "less"
    "lzip"
    "man-db"
    "net-tools"
    "nftables"
    "nss-certs"
    "openssh-sans-x"
    "patch"
    "pinentry-tty"
    "emacs-pinentry"
    "procps"
    "psmisc"
    "python"
    "rsync"
    "sed"
    "shadow"
    "sudo"
    "tar"
    "tree-sitter"
    "util-linux-with-udev"
    "wget"
    "which"
    "my-xonsh"
    "xz")))

(define-public %my-base-services
  (append
      (list (service login-service-type my-motd)
            (service nftables-service-type)
            (service openssh-service-type)
            (service unattended-upgrade-service-type))))
  
;;; system.scm ends here
