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
  #:use-module (gnu packages bash)
  #:use-module (gnu packages certs)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages emacs-xyz)
  #:use-module (gnu packages file-systems)
  #:use-module (gnu packages gawk)
  #:use-module (gnu packages guile)
  #:use-module (gnu packages guile-xyz)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages less)
  #:use-module (gnu packages man)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages polkit)
  #:use-module (gnu packages rsync)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages texinfo)
  #:use-module (gnu packages tree-sitter)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages virtualization)
  #:use-module (gnu packages wget)
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
    "bridge-utils"
    "bzip2"
    "coreutils"
    "diffutils"
    "my-emacs-next-no-x"
    "emacs-with-editor"
    "emacs-cape"
    "emacs-combobulate"
    "emacs-consult"
    "emacs-consult-denote"
    "emacs-corfu"
    "emacs-denote"
    "emacs-eat"
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
    "emacs-multiple-cursors"
    "emacs-orderless"
    "emacs-pcmpl-args"
    "emacs-rainbow-delimiters"
    "emacs-vertico"
    "emacs-vundo"
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
    "iproute"
    "kmod"
    "lxc"
    "lzip"
    "man-db"
    "ncurses"
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
    "sysdig"
    "falcosecurity-libs"
    "tar"
    "texinfo"
    "tree-sitter-bash"
    "tree-sitter-dockerfile"
    "tree-sitter-json"
    "tree-sitter-python"
    "util-linux+udev"
    "wget"
    "which"
    "xz")))

(define-public %my-base-services
  (append
      (list (service my-dns)
            (service login-service-type my-motd)
            (service nftables-service-type)
            (service ntp-service-type)
            (service openssh-service-type
              (openssh-configuration
                (authorized-keys
                  ("ka0x" ,(local-file "ka0x.pub"))))))))

;;; my-system.scm ends here
