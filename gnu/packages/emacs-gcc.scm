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

(define-module (my packages emacs)
  #:use-module (guix packages)
  #:use-module (guix memoization)
  #:use-module (guix git-download)
  #:use-module (guix utils)
  #:use-module (guix build utils)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages webkit)
  #:use-module (gnu packages xorg)
  #:use-module (ice-9 regex)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-26))

(define-public emacs-next-gcc
    (package
      (inherit emacs-next)
      (name "emacs-next-gcc")
      (snippet
          '(begin
            (with-directory-excursion "emacs/lisp"
              (for-each delete-file-recursively
                '("obsolete"
                  "play")))))
      (arguments
       (substitute-keyword-arguments (package-arguments emacs-next)
         ((#:configure-flags flags ''())
          `(cons* "--with-native-compilation" ,flags))))))


(define-public emacs-next-gcc-no-x
    (package
      (inherit emacs-next-gcc)
      (define-public emacs-gcc-no-x
    (build-system gnu-build-system)
    (inputs (fold alist-delete
                  (package-inputs emacs)
                  '("libx11" "gtk+" "libxft" "libtiff" "giflib" "libjpeg"
                    "imagemagick" "libpng" "librsvg" "libxpm" "libice"
                    "libsm" "cairo" "pango" "harfbuzz"

                    ;; These depend on libx11, so remove them as well.
                    "libotf" "m17n-lib" "dbus")))
      (arguments
       (substitute-keyword-arguments (package-arguments emacs-next-no-x)
         ((#:configure-flags flags ''())
          `(delete "--with-cairo" ,flags))
       ((#:phases phases)
        `(modify-phases ,phases
           (delete 'restore-emacs-pdmp)
           (delete 'strip-double-wrap))))))))

;;; emacs-gcc.scm ends here
