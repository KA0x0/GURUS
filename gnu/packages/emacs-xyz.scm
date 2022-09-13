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

(define-public emacs-jabber
  (package
    (name "emacs-jabber")
    (version "20220713.1538")
    (source
      (origin
       (method url-fetch)
       (uri (string-append "https://melpa.org/packages/jabber-"version ".tar")
               (commit
                 "af0315e174fa6446d5c4dd3e6465d48912950e58")))
        (sha256
          (base32
            "1fif38qhiaxskfmqin82n9334bzrkgd1h5ip1djcm571i670gj74"))))
    (build-system melpa-build-system)
    (propagated-inputs (list emacs-async))
    (home-page "https://melpa.org/#/jabber")
    (synopsis "A Jabber client for Emacs.")
    (description
      "This is jabber.el, an XMPP client for Emacs. XMPP (also known as 'Jabber') is an instant messaging system; see http://xmpp.org for more information.")
    (license #f)))

;;; emacs-xyz.scm ends here
