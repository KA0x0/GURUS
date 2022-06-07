(use-modules (gnu) (guix) (guix packages) (srfi srfi-1))
(use-service-modules desktop mcron networking shepherd ssh virtualization xorg)
(use-package-modules bootloaders certs fonts package-management)

(operating-system
  (locale "en_US.utf8")
  (timezone "America/New_York")
  (keyboard-layout (keyboard-layout "us" "ru"))
  (host-name "laptop")
  (users (cons* (user-account
                  (name "mobile")
                  (comment "Mobile")
                  (group "users")
                  (home-directory "/home/mobile")
                  (supplementary-groups
                    '("audio" "kvm" "netdev" "video" "wheel")))
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
        dbus
        emacs-with-native-comp
        emacs-exwm
        lm-sensors
        sx
        usbguard
        xrandr
        xsecurelock)
 %my-base-packagess))
  (services
    (append
      (list (service elogind-service-type)
            (service libvirt-service-type)
            (service login-service-type my-motd)
            (service network-manager-service-type)
            (service openssh-service-type)
            (service unattended-upgrade-service-type)
            (service wpa-supplicant-service-type)
      %base-services))))

;;; laptop-config.scm ends here
