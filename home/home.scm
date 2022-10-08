;; This "home-environment" file can be passed to 'guix home reconfigure'
;; to reproduce the content of your profile.  This is "symbolic": it only
;; specifies package names.  To reproduce the exact same profile, you also
;; need to capture the channels being used, as returned by "guix describe".
;; See the "Replicating Guix" section in the manual.

(use-modules (gnu home) (gnu home services) (gnu home services shells) (guix gexp) (gnu services) (guix-package admin) (gnu packages bash))

(home-environment
  (services
    (list (service home-bash-service-type
            (home-bash-configuration
              (aliases                                                                             ;; use "\" to escape aliases.
               '(("cp" . "rsync -avhW --progress --info=progress2")
                 ("dd" . "dd status=progress")
                 ("df" . "df --human-readable")
                 ("dir" . "dir --color=auto")
                 ("egrep" . "egrep --color=auto")
                 ("emacs" . "emacsclient -a -c")
                 ("fgrep" . "fgrep --color=auto")
                 ("free" . "free --human")
                 ("grep" . "grep --color=auto")
                 ("ls" . "ls -lr --all --color=auto --dired --human-readable -v")
                 ("logout" . "pkill emacsclient & logout")
                 ("mkdir" . "mkdir --parents --verbose")
                 ("mv" . "rsync -avhW --progress --info=progress2 --remove-source-files")
                 ("nc" . "socat -,rawer,escape=0x1d tcp:")
                 ("rm" . "rm --interactive --verbose")
                 ("vdir" . "vdir --color=auto")
                 ("wget" . "wget --show-progress")))
              (environment-variables
                 ("EDITOR" . ,(file-append emacs "/bin/emacsclient -a -c"))
                 ("VISUAL" . ,(file-append emacs "/bin/emacsclient -a -c"))
                 ("SHELL" . ,(file-append bash "/bin/bash")))))
            (service home-shepherd-service-type
              (home-shepherd-configuration
               (services
                (list
                  (shepherd-service
                    (provision '(emacs))
                    (start #~(make-system-constructor "emacs --daemon"))
                     (stop #~(make-system-constructor "emacsclient -e '(kill-emacs)'"))
                  (service unattended-upgrade-service-type)))))))))

;;; home.scm ends here
