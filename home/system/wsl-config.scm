;;; Code:

(use-modules (gnu) (guix) (guix packages) (srfi srfi-1)
(use-service-modules mcron)
(use-package-modules certs)

(operating-system
   (host-name "wsl")
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
                  (shell (file-append bash "/bin/bash")))
                 (user-account
                  (inherit %root-account)
                  (shell (wsl-boot-program "guest")))
                 %base-user-accounts))
   (packages
    (append
      (list
        xf86-video-amdgpu
        sshfs
        xorg-server-xwayland
        my-wslu)
      %my-base-packages))
   (services
    (append
      (list
        (service guix-service-type)
        (service special-files-service-type
          `(("/bin/sh" ,(file-append bash "/bin/bash"))
            ("/bin/mount" ,(file-append util-linux "/bin/mount"))
            ("/usr/bin/env" ,(file-append coreutils "/bin/env"))
      %base-services
      %my-base-services))))

;;; wsl-config.scm ends here
