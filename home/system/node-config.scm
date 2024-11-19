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
                    '("incus" "kvm" "netdev" "wheel")))
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
                    (image "justarchi/archisteamfarm:released")
                    (provision "archisteamfarm")
                    (ports
                      '("1242" . "1242"))
                    (volumes
                      '("/mnt/storage/kaox/config/archisteamfarm/config:/app/config")
                       ("/mnt/storage/kaox/config/archisteamfarm/plugins:/app/plugins"))
                    (environment
                      '("TZ" . "Etc/Greenwich")))))
      %base-services
      %my-base-services))))

;;; node-config.scm ends here
