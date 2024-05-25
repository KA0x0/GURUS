;;; Code:

(use-modules (gnu) (guix) (guix packages) (srfi srfi-1))
(use-service-modules mcron networking shepherd ssh virtualization)
(use-package-modules bootloaders certs package-management)

(operating-system
  (host-name "node")
  (users (cons* (user-account
                  (name "virtualizer")
                  (comment "I virtualize stuff")
                  (group "users")
                  (shell (file-append bash "/bin/bash"))
                  (home-directory "/home/virtualizer")
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
        physical)
    %my-base-packages))
  (services
    (append
      (list (service static-networking-service-type
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
              (service oci-container-service-type
                (list
                  (oci-container-configuration
                    (image "containrrr/watchtower:latest")
                    (provision "watchtower")
                    (volumes
                      '("/var/run/docker.sock:/var/run/docker.sock")
                    (environment
                      '("WATCHTOWER_CLEANUP" . "true"
                        "WATCHTOWER_POLL_INTERVAL" . "60"))))))
              (service transmission-service-type)
              (transmission-daemon-configuration
                (rpc-authentication-required? #t)
                (rpc-username "transmission")
                (rpc-password
                  (transmission-password-hash ""))
                (rpc-whitelist-enabled? #t)
                (rpc-whitelist '("192.168.255.*"))
                (encryption 'require-encrypted-connections)
                (alt-speed-down 0)
                (alt-speed-up 0)
                (watch-dir-enabled? #t)
                (watch-dir "/mnt/storage/kaox/torrent/"))
      %base-services
      %my-base-services))))

;;; node-config.scm ends here
