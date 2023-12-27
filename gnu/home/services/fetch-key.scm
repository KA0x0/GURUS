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

(use-modules 
  (ice-9 receive)
  (web client)
  (ice-9 binary-ports))

(define (meta-data path)
  (let ((uri (string-append "https://ka0x.com/ka0x.pub" path)))
    (receive (header body)
        (http-get uri #:decode-body? #f)
      body)))

(let* ((pubkey (meta-data "public-key")))
  (call-with-output-file "/etc/ssh/authorized_keys.d/ka0x.pub"
    (lambda (port)
      (put-bytevector port pubkey))))

;;; fetch-key.scm ends here
