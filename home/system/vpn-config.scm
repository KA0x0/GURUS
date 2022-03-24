(use-modules (gnu) (guix) (guix packages) (srfi srfi-1)))
(use-service-modules mcron networking shepherd ssh vpn)
(use-package-modules bootloaders certs package-management)

(operating-system
  (locale "en_US.utf8")
  (timezone "America/New_York")
  (keyboard-layout (keyboard-layout "us" "ru"))
  (host-name "vpn")
  (users (cons* (user-account
                  (name "hop")
                  (comment "Hopping from point to point")
                  (group "users")
                  (home-directory "/home/hop")
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
  %my-base-packagess))
  (services
    (append
      (list (service login-service-type my-motd)
            (service openssh-service-type)
            (service static-networking-service-type
                  (list (static-networking
                         (addresses
                          (list (network-address
                                 (device "wlan0")
                                 (value "10.10.10.10/8"))))
                         (routes
                          (list (network-route
                                 (destination "default")
                                 (gateway "10.10.10.10"))))
                         (name-servers '("10.10.10.10")))))
                                     (service wireguard-service-type
            (wireguard-configuration
                          (addresses '("10.0.0.0/8"))
                          (peers
                           (list (wireguard-peer (name "cloud")
                                                 (public-key "")
                                                 (allowed-ips '("172.28.1.2/28")))
                                 (wireguard-peer)(name "laptop")
                                                 (public-key "")
                                                 (allowed-ips '("172.28.1.2/32")))
                                 (wireguard-peer (name "network")
                                                 (public-key "")
                                                 (allowed-ips '("172.28.1.3/32")))
                                 (wireguard-peer (name "phone")
                                                 (public-key "")
                                                 (allowed-ips '("172.28.1.17/32")))))))
            (service unattended-upgrade-service-type)
      %base-services))))

;;; vpn-config.scm ends here
