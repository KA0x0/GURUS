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
  (package
    (name "emacs-mentor")
    (version "20220113.2136")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/skangas/mentor.git")
               (commit
                 "afab3a14a4bfb5117f8e25417fdf151611b3df0b")))
        (sha256
          (base32
            "0wcmgynshjk9xdiv4y86d5qb7ncxkswim2gp34hkhslhvfmhfh8f"))))
    (build-system melpa-build-system)
    (propagated-inputs
      (list emacs-xml-rpc emacs-async))
    (home-page "https://github.com/skangas/mentor")
    (synopsis
      "Frontend for the rTorrent bittorrent client")
    (description
      "Documentation at https://melpa.org/#/mentor")
    (license #f)))

(define-public emacs-jabber
  (package
    (name "emacs-jabber")
    (version "20180927.2325")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/legoscia/emacs-jabber.git")
               (commit
                 "fff33826f42e040dad7ef64ea312d85215d3b0a1")))
        (sha256
          (base32
            "1fif38qhiaxskfmqin82n9334bzrkgd1h5ip1djcm571i670gj74"))))
    (build-system melpa-build-system)
    (propagated-inputs (list emacs-fsm emacs-srv))
    (arguments
      '(#:files
        ("*.el"
         "*.texi"
         ("jabber-fallback-lib"
          "jabber-fallback-lib/hexrgb.el"))))
    (home-page "unspecified")
    (synopsis "A Jabber client for Emacs.")
    (description
      "Documentation at https://melpa.org/#/jabber")
    (license #f)))

;;; emacs-xyz.scm ends here
