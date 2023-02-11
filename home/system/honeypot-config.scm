(use-modules (gnu) (guix) (guix packages) (srfi srfi-1))
(use-service-modules mcron networking shepherd ssh)
(use-package-modules bootloaders certs package-management)

(operating-system
  (locale "en_US.utf8")
  (timezone "Etc/Greenwich")
  (keyboard-layout (keyboard-layout "us" "ru"))
  (host-name "pot")
  (users (cons* (user-account
                  (name "honey")
                  (comment "honey")
                  (group "users")
                  (shell (file-append xonsh "/bin/xonsh"))
                  (home-directory "/home/honey")
                  (supplementary-groups
                    '("netdev" "wheel")))
                %base-user-accounts))
  (bootloader
    (bootloader-configuration
      (bootloader grub-efi-bootloader)
      (target "/boot/efi")
      (keyboard-layout keyboard-layout)))
  (mapped-devices
    (list (mapped-device
            (source
              (uuid ""))
            (target "cryptroot")
            (type luks-device-mapping))))
  (file-systems
    (cons* (file-system
             (mount-point "/")
             (device "/dev/mapper/cryptroot")
             (type "bcachefs")
             (dependencies mapped-devices))
           (file-system
             (mount-point "/boot/efi")
             (device (uuid "" 'fat32))
             (type "vfat"))
           %base-file-systems))
  (packages
    (append
      %my-base-packages))
  (services
    (append
      (list
        (service network-manager-service-type)
      %base-services
      %my-base-services))))

;;; honeypot-config.scm ends here
