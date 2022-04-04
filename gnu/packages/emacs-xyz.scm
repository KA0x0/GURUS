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

(define-module (my packages emacs-xyz)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix cvs-download)
  #:use-module (guix download)
  #:use-module (guix bzr-download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix hg-download)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system emacs)
  #:use-module (guix build-system glib-or-gtk)
  #:use-module (guix build-system perl)
  #:use-module (guix build-system trivial)
  #:use-module (gnu packages)
  #:use-module (guix utils)
  #:use-module (srfi srfi-1)
  #:use-module (ice-9 match))

(define-public emacs-mentor
  (let ((commit "3336eaa97de923f74b90dda3e35985e122d40805")
        (revision "1"))   
    (package
      (name "emacs-mentor")
      (version (git-version "0.3.5" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/skangas/mentor")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "ebc43db934fab4345ef63c1c0f7113b9293d0646"))))
      (build-system emacs-build-system)
      (arguments
       `(#:tests? #f))                  ; requires network access.
      (propagated-inputs
       (list emacs-deferred))
      (home-page "https://github.com/skangas/mentor")
      (synopsis "mentor is a GNU Emacs frontend for the rTorrent bittorrent client.")
      (description "mentor is a GNU Emacs frontend for the rTorrent bittorrent client.")
      (license license:gpl3+))))

;;; emacs-xyz.scm ends here
