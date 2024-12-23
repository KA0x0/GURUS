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

(cons* (channel
        (name 'GURU)
        (url "https://git.sr.ht//GURU"))
       (channel
        (name 'sops-guix)
        (url "https://git.sr.ht/~fishinthecalculator/sops-guix")
        (branch "main")
        (introduction
         (make-channel-introduction
          "0bbaf1fdd25266c7df790f65640aaa01e6d2dbc9"
      (openpgp-fingerprint
        "D088 4467 87F7 CBB2 AE08  BE6D D075 F59A 4805 49C3"))))
       %default-channels)

;;; channels.scm ends here
