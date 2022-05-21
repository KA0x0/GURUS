(use-modules (gnu) (guix) (guix packages) (srfi srfi-1))
(use-service-modules mcron networking shepherd ssh)
(use-package-modules bootloaders certs package-management)

(operating-system
  (locale "en_US.utf8")
  (timezone "America/New_York")
  (keyboard-layout (keyboard-layout "us" "ru"))
  (host-name "ntp")
  (users (cons* (user-account
                  (name "time")
                  (comment "Tik Tok")
                  (group "users")
                  (home-directory "/home/time")
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
      (list
      )
 %my-base-packages))
  (services
    (append
      (list (service login-service-type my-motd)
            (service network-manager-service-type)
            (service openssh-service-type)
            (service unattended-upgrade-service-type)
      %base-services))))

;;; ntp-config.scm ends here
