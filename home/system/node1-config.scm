(use-modules (gnu) (guix) (guix packages) (srfi srfi-1))
(use-service-modules mcron networking shepherd ssh virtualization)
(use-package-modules bootloaders certs package-management)

(operating-system
  (locale "en_US.utf8")
  (timezone "America/New_York")
  (keyboard-layout (keyboard-layout "us" "ru"))
  (host-name "node50")
  (users (cons* (user-account
                  (name "vm")
                  (comment "Virtual Manager")
                  (group "users")
                  (shell (file-append xonsh "/bin/xonsh"))
                  (home-directory "/home/vm")
                  (supplementary-groups
                    '("kvm" "netdev" "wheel")))
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
      lm-sensors
      usbguard
      )
  %my-base-packages))
  (services
    (append
      (list (service login-service-type my-motd)
            (service openssh-service-type)
            (service rtorrent-service-type)
            (service static-networking-service-type
                  (list (static-networking
                         (addresses
                          (list (network-address
                                 (device "eno1")
                                 (value "10.0.0.50/8"))))
                         (routes
                          (list (network-route
                                 (destination "default")
                                 (gateway "10.10.10.10"))))
                         (name-servers '("10.10.10.10")))))
            (service unattended-upgrade-service-type)
            %base-services))))

;;; node1-config.scm ends here
