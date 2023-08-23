;;; Code:

(use-modules (gnu)

(operating-system
  (locale "en_US.utf8")
  (timezone "Etc/Greenwich")
  (keyboard-layout (keyboard-layout "us" "ru"))
  (host-name "template")
  (users (cons* (user-account
                  (name "minimal")
                  (comment "Minimal")
                  (group "users")
                  (home-directory "/home/minimal")
                  (supplementary-groups
                    '("netdev" "wheel")))
                %base-user-accounts))
  (bootloader
    (bootloader-configuration
      (bootloader grub-efi-bootloader)
      (target "/boot/efi")
      (keyboard-layout keyboard-layout)))
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
        busybox))))

;;; template.scm ends here
