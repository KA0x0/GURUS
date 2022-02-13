;;; GNU Guix --- Functional package management for GNU
;;;
;;; This file is NOT part of GNU Guix.
;;;
;;; GNU Guix is free software; you can redistribute it and/or modify it
;;; under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 3 of the License, or (at
;;; your option) any later version.
;;;
;;; GNU Guix is distributed in the hope that it will be useful, but
;;; WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with GNU Guix.  If not, see <http://www.gnu.org/licenses/>.

(define-module (gnu services admin)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages certs)
  #:use-module (gnu packages package-management)
  #:use-module (gnu services)
  #:use-module (gnu services mcron)
  #:use-module (gnu services shepherd)
  #:use-module (guix gexp)
  #:use-module (guix modules)
  #:use-module (guix packages)
  #:use-module (guix records)
  #:use-module (srfi srfi-1)
  #:use-module (ice-9 vlist)
  #:export (%default-rotations
            %rotated-files

            log-rotation
            log-rotation?
            log-rotation-frequency
            log-rotation-files
            log-rotation-options
            log-rotation-post-rotate

            rottlog-configuration
            rottlog-configuration?
            rottlog-service
            rottlog-service-type

            unattended-upgrade-service-type
            unattended-upgrade-configuration
            unattended-upgrade-configuration?
            unattended-upgrade-configuration-operating-system-file
            unattended-upgrade-configuration-channels
            unattended-upgrade-configuration-schedule
            unattended-upgrade-configuration-services-to-restart
            unattended-upgrade-configuration-system-expiration
            unattended-upgrade-configuration-maximum-duration
            unattended-upgrade-configuration-log-file))

(define my-motd
     (service login-service-type
               (login-configuration
                (motd (plain-file "motd" "\
UNAUTHORIZED ACCESS TO THIS DEVICE IS PROHIBITED.\n
You must have explicit, authorized permission to access or configure this device.\n
Unauthorized attempts and actions to access or use this system may result in civil and/or criminal penalties.\n
All activities performed on this device are logged and monitored.\n\n")))))

;;;
;;; Unattended upgrade.
;;;

(define-record-type* <unattended-upgrade-configuration>
  unattended-upgrade-configuration make-unattended-upgrade-configuration
  unattended-upgrade-configuration?
  (operating-system-file unattended-upgrade-operating-system-file
                         (default "/run/current-system/configuration.scm"))
  (schedule             unattended-upgrade-configuration-schedule
                        (default "30 01 * * 0"))
  (channels             unattended-upgrade-configuration-channels
                        (default #~%default-channels))
  (services-to-restart  unattended-upgrade-configuration-services-to-restart
                        (default '(mcron)))
  (system-expiration    unattended-upgrade-system-expiration
                        (default (* 3 30 24 3600)))
  (maximum-duration     unattended-upgrade-maximum-duration
                        (default 3600))
  (log-file             unattended-upgrade-configuration-log-file
                        (default %unattended-upgrade-log-file)))

(define %unattended-upgrade-log-file
  "/var/log/unattended-upgrade.log")

(define (unattended-upgrade-mcron-jobs config)
  (define channels
    (scheme-file "channels.scm"
                 (unattended-upgrade-configuration-channels config)))

  (define log
    (unattended-upgrade-configuration-log-file config))

  (define services
    (unattended-upgrade-configuration-services-to-restart config))

  (define expiration
    (unattended-upgrade-system-expiration config))

  (define config-file
    (unattended-upgrade-operating-system-file config))

  (define code
    (with-imported-modules (source-module-closure '((guix build utils)
                                                    (gnu services herd)))
      #~(begin
          (use-modules (guix build utils)
                       (gnu services herd)
                       (srfi srfi-19)
                       (srfi srfi-34))

          (define log
            (open-file #$log "a0"))

          (define (timestamp)
            (date->string (time-utc->date (current-time time-utc))
                          "[~4]"))

          (define (alarm-handler . _)
            (format #t "~a time is up, aborting upgrade~%"
                    (timestamp))
            (exit 1))

          ;; 'guix time-machine' needs X.509 certificates to authenticate the
          ;; Git host.
          (setenv "SSL_CERT_DIR"
                  #$(file-append nss-certs "/etc/ssl/certs"))

          ;; Make sure the upgrade doesn't take too long.
          (sigaction SIGALRM alarm-handler)
          (alarm #$(unattended-upgrade-maximum-duration config))

          ;; Redirect stdout/stderr to LOG to save the output of 'guix' below.
          (redirect-port log (current-output-port))
          (redirect-port log (current-error-port))

          (format #t "~a starting upgrade...~%" (timestamp))
          (guard (c ((invoke-error? c)
                     (report-invoke-error c)))
            (invoke #$(file-append guix "/bin/guix")
                    "time-machine" "-C" #$channels
                    "--" "system" "reconfigure" #$config-file)

            ;; 'guix system delete-generations' fails when there's no
            ;; matching generation.  Thus, catch 'invoke-error?'.
            (guard (c ((invoke-error? c)
                       (report-invoke-error c)))
              (invoke #$(file-append guix "/bin/guix")
                      "system" "delete-generations"
                      #$(string-append (number->string expiration)
                                       "s")))

            (format #t "~a restarting services...~%" (timestamp))
            (for-each restart-service '#$services)

            ;; XXX: If 'mcron' has been restarted, perhaps this isn't
            ;; reached.
            (format #t "~a upgrade complete~%" (timestamp))))))

  (define upgrade
    (program-file "unattended-upgrade" code))

  (list #~(job #$(unattended-upgrade-configuration-schedule config)
               #$upgrade)))

(define (unattended-upgrade-log-rotations config)
  (list (log-rotation
         (files
          (list (unattended-upgrade-configuration-log-file config))))))

(define unattended-upgrade-service-type
  (service-type
   (name 'unattended-upgrade)
   (extensions
    (list (service-extension mcron-service-type
                             unattended-upgrade-mcron-jobs)
          (service-extension rottlog-service-type
                             unattended-upgrade-log-rotations)))
   (description
    "Periodically upgrade the system from the current configuration.")
   (default-value (unattended-upgrade-configuration))))

;;; admin.scm ends here