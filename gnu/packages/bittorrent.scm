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

(use-modules (guix packages) (gcrypt hash))
(use-modules (gnu packages bittorrent))

(define my-transmission
  (package
    (inherit transmission)
    (version "4.0.3")
    (source (sha256
               (base32
                "0njlmpcdsxwx8vwdk9dvsby51l6f6awks9d0mgvi9fs2ivaizc5n")))))

;;; bittorrent.scm ends here
