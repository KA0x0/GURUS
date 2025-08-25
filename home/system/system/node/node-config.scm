;;; Code:

(use-modules (gnu) (guix) (guix packages) (srfi srfi-1))
(use-service-modules mcron networking shepherd ssh virtualization)
(use-package-modules admin bash certs compression emacs emacs-xyz file-systems gawk guile guile-xyz less linux man ncurses polkit rsync python python-web texinfo tree-sitter version-control virtualization wget)

(operating-system
  (host-name "node")
  (users (cons* (user-account
                  (name "virtualizer")
                  (comment "I virtualize stuff")
                  (group "users")
                  (shell (file-append bash "/bin/bash"))
                  (home-directory "/home/virtualizer")
                  (supplementary-groups
                    '("kvm" "netdev")))
                %base-user-accounts))
  (bootloader
    (bootloader-configuration
      (bootloader grub-efi-bootloader)
      (targets "/boot/efi")
      (keyboard-layout keyboard-layout)))
  (mapped-devices
    (list (mapped-device
            (source
              (uuid ""))
            (targets '("cryptroot"))
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
            (service oci-contaier-service-type
              list
                (oci-container-configuration
                  (network "host")
                  (image "docker.io/justarchi/archisteamfarm:released")
                  (ports
                    '(("1242" . "80"))))
                (oci-container-configuration
                  (network "host")
                  (image "docker.io/mrcraftcod/channel-points-miner:develop")
                  (volumes
                    '((/mnt/storage/config/channel-points-miner/authentication:/usr/src/app/authentication)
                     (/mnt/storage/config/channel-points-miner/channel:/usr/src/app/channel:ro)
                     (/mnt/storage/config/channel-points-miner/config.json:/usr/src/app/config.json:ro)))))
        %base-services
        %my-base-services))))

;;; node-config.scm ends here
