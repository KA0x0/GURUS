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
;;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

(define-module (gnu system)
  #:use-module (guix inferior)
  #:use-module (guix store)
  #:use-module (guix monads)
  #:use-module (guix gexp)
  #:use-module (guix records)
  #:use-module (guix packages)
  #:use-module (guix derivations)
  #:use-module (guix profiles)
  #:use-module ((guix utils) #:select (substitute-keyword-arguments))
  #:use-module (guix i18n)
  #:use-module (guix diagnostics)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cross-base)
  #:use-module (gnu packages cryptsetup)
  #:use-module (gnu packages disk)
  #:use-module (gnu packages file-systems)
  #:use-module (gnu packages firmware)
  #:use-module (gnu packages gawk)
  #:use-module (gnu packages guile)
  #:use-module (gnu packages guile-xyz)
  #:use-module (gnu packages hurd)
  #:use-module (gnu packages less)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages man)
  #:use-module (gnu packages nano)
  #:use-module (gnu packages nvi)
  #:use-module (gnu packages package-management)
  #:use-module (gnu packages pciutils)
  #:use-module (gnu packages texinfo)
  #:use-module (gnu packages text-editors)
  #:use-module (gnu packages wget)
  #:use-module (gnu services)
  #:use-module (gnu services shepherd)
  #:use-module (gnu services base)
  #:use-module (gnu bootloader)
  #:use-module (gnu system shadow)
  #:use-module (gnu system nss)
  #:use-module (gnu system locale)
  #:use-module (gnu system pam)
  #:use-module (gnu system linux-initrd)
  #:use-module (gnu system setuid)
  #:use-module (gnu system uuid)
  #:use-module (gnu system file-systems)
  #:use-module (gnu system mapped-devices)
  #:use-module (ice-9 match)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-26)
  #:use-module (srfi srfi-34)
  #:use-module (srfi srfi-35)
  #:use-module (rnrs bytevectors)
  #:export (%my-base-packages)
  #:export (%my-base-settings))


(define-public %my-base-packages
  (map specification->package
  '("bash"
    "bash-completion"
    "emacs-bash-completion"
    "bzip2"
    "chrony"
    "coreutils"
    "curl"
    "diffutils"
    "emacs-next-gcc-no-x"
    "emacs-async"
    "emacs-consult"
    "emacs-embark"
    "emacs-meow"
    "emacs-geiser"
    "emacs-geiser-guile"
    "emacs-guix"
    "emacs-magit"
    "emacs-orderless"
    "emacs-org"
    "emacs-paredit" 
    "emacs-tramp"
    "emacs-undo-tree"
    "emacs-which-key"
    "eudev"
    "findutils"
    "gawk"
    "git"
    "grep"
    "guile"
    "guile-colorized"
    "guile-readline"
    "gzip"
    "kmod"
    "less"
    "lzip"
    "man-db"
    "nss-certs"
    "openssh-sans-x"
    "patch"
    "procps"
    "psmisc"
    "python"
    "rsync"
    "sed"
    "shadow"
    "sudo"
    "tar"
    "util-linux-with-udev"
    "wget"
    "which"
    "xz")))

(define-public %my-base-settings
  (operating-system
   (locale "en_US.utf8")
   (keyboard-layout (keyboard-layout "us" "ru")))
  
;;; system.scm ends here