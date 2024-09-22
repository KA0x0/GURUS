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

(use-modules (guix packages)
             (guix download)
             (guix build-system gnu)
             (guix licenses))

(package
  (name "my-wslu")
  (version "4.1.3")
  (source (origin
            (method url-fetch)
            (uri (string-append "https://github.com/wslutilities/wslu/archive/refs/tags/v" version
                                ".tar.gz"))
            (sha256
             (base32
              "78012fb2e3af46b4cd767bca2af047f03723b41d"))))
  (build-system gnu-build-system)
  (synopsis "A collection of utilities for WSL")
  (description
   "This is a collection of utilities for Windows 10 Linux Subsystem, such as retrieving Windows 10 environment variables or creating your favorite Linux GUI application shortcuts on Windows 10 Desktop.
Requires Windows 10 Creators Update; Some of the feature requires a higher version of Windows 10; Supports WSL2.")
  (home-page "https://github.com/wslutilities/wslu")
  (license gpl3+))

;;; emacs.scm ends here
