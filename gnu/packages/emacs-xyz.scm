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
  #:use-module (guix download)
  #:use-module (gnu packages emacs-xyz)
  #:use-module (guix git-download)
  #:use-module (gnu packages emacs-xyz)


(define-public emacs-dirvish
  (package
    (name "emacs-dirvish")
    (version "20230123.1201")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/alexluigit/dirvish.git")
               (commit
                 "4b63cd2e5ba994f8e674388db7035de1a8f0343f")))
        (sha256
          (base32
            "1qp71p28h2k8xxpcsfxgdpgg587gaxwi6ialjwmhbd8qf07q4x3j"))))
    (build-system melpa-build-system)
    (arguments
      '(#:files (:defaults "extensions/*.el")))
    (home-page
      "https://github.com/alexluigit/dirvish")
    (synopsis
      "A modern file manager based on dired mode")
    (description
      "Dirvish is an improved version of the Emacs inbuilt package Dired. It not only gives Dired an appealing and highly customizable user interface, but also comes together with almost all possible parts required for full usability as a modern file manager.")
    (license license:gpl3)))

(define-public emacs-jabber
  (package
    (name "emacs-jabber")
    (version "20220713.1538")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://codeberg.org/emacs-jabber/emacs-jabber.git")
               (commit
                 "af0315e174fa6446d5c4dd3e6465d48912950e58")))
        (sha256
          (base32
            "08q0hbm4pvp8sf261w1ihqa93sg8blfybfkhq7wrnvgs6kasgwvq"))))
    (build-system melpa-build-system)
    (propagated-inputs (list emacs-fsm emacs-srv))
    (arguments
      '(#:files
        (:defaults
          "*.org"
          ("jabber-fallback-lib"
           "jabber-fallback-lib/hexrgb.el"))))
    (home-page
      "https://codeberg.org/emacs-jabber/emacs-jabber")
    (synopsis "A Jabber client for Emacs.")
    (description
      "This is jabber.el, an XMPP client for Emacs. XMPP (also known as 'Jabber') is an instant messaging system; see https://xmpp.org for more information.")
    (license #f)))

;;; emacs-xyz.scm ends here
