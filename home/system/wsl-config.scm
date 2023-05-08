;;; Code:

(use-modules (gnu) (guix) (guix packages) (srfi srfi-1)
(use-service-modules mcron)
(use-package-modules certs)

(operating-system
   (host-name "wsl")
   (timezone "Etc/Greenwich")
   (bootloader
    (bootloader-configuration
     (bootloader dummy-bootloader)))
   (kernel dummy-kernel)
   (initrd dummy-initrd)
   (initrd-modules '())
   (firmware '())
   (file-systems '())
   (users (cons* (user-account
                  (name "kracken")
                  (comment "Kracking hashes")
                  (group "users")
                  (supplementary-groups
                    '("audio" "kvm" "video" "wheel"))
                  (shell (file-append xonsh "/bin/xonsh")))
                 (user-account
                  (inherit %root-account)
                  (shell (wsl-boot-program "guest")))
                 %base-user-accounts))
   (packages
    (append
      (list
        xf86-video-amdgpu
        sshfs
        xorg-server-xwayland)
      %my-base-packages))
   (services
    (append
      (list
        (service guix-service-type)
        (service special-files-service-type
          `(("/bin/sh" ,(file-append bash "/bin/bash"))
            ("/bin/mount" ,(file-append util-linux "/bin/mount"))
            ("/usr/bin/env" ,(file-append coreutils "/bin/env"))
        (service unattended-upgrade-service-type))))
      %base-services
      %my-base-services))))

;;; wsl-config.scm ends here
