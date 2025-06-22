;; This "home-environment" file can be passed to 'guix home reconfigure'
;; to reproduce the content of your profile.  This is "symbolic": it only
;; specifies package names.  To reproduce the exact same profile, you also
;; need to capture the channels being used, as returned by "guix describe".
;; See the "Replicating Guix" section in the manual.

;;; Code:

(use-modules
  (gnu home)
  (gnu home services)
  (gnu home services dotfiles)
  (gnu home services shells)
  (guix gexp)
  (gnu services)
  (guix-package admin)
  (gnu packages bash))

(home-environment
  (services
    (list (service home-bash-service-type
            (home-bash-configuration
              (aliases ;; use "\" to escape aliases.
               ("cp"         . "rsync --archive --human-readable --info=progress2 --progress --verbose")
               ("curl"       . "curl --verbose")
               ("dd"         . "dd status=progress")
               ("df"         . "df --human-readable")
               ("dir"        . "emacsclient --create-frame --eval '(list-directory)' --no-wait")
               ("emacs"      . "emacsclient --create-frame --no-wait")
               ("grep"       . "grep --color=auto")
               ("ll"         . "ls --all --color=auto --dired --human-readable --indicator-style -l -v")
               ("ls"         . "ls --almost-all --color=auto --dired --human-readable --indicator-style -v")
               ("logout"     . "emacsclient --eval '(server-delete-client)' & logout")
               ("mkdir"      . "mkdir --parents --verbose")
               ("mv"         . "rsync --archive --human-readable --info=progress2 --progress --remove-source-files --verbose")
               ("nc"         . "socat -,rawer,escape=0x1d tcp:$@")
               ("patch"      . "patch --backup --verbose")
               ("ping"       . "ping -v")
               ("ping6"      . "ping6 -v")
               ("powershell" . "pwsh -NoLogo")
               ("ps"         . "ps --forest")
               ("rm"         . "rm -I --one-file-system --verbose")
               ("sysdig"     . "sudo sysdig --modern-bpf")
               ("csysdig"    . "sudo csysdig --modern-bpf")
               ("vdir"       . "emacsclient --create-frame --eval '(dired)' --no-wait"))
              (environment-variables
               ("BROWSER"          . ,(file-append brave /bin/brave --enable-gpu-rasterization --enable-zero-copy --ignore-gpu-blocklist --enable-vulkan --enable-parallel-downloading")
               ("EDITOR"           . "$HOME/.guix-profile/bin/emacsclient --create-frame --no-wait")
               ("ALTERNATE_EDITOR" . "/run/current-system/profile/bin/herd start emacs-daemon || emacsclient --create-frame --nowait --alternate-editor '$BACKUPEDITOR'")  ;; Emacs hardcoded var name
               ("BACKUPEDITOR"     . ,(file-append guile-emacs /bin/emacs))
               ("HISTCONTROL"      . "ignoreboth")
               ("HISTFILESIZE"     . "4096")
               ("HISTSIZE"         . "4096")
               ("PYTHONSTARTUP"    . "$HOME/config/python/pythonrc.py")
               ("IPYTHONDIR"       . "$HOME/config/python/ipython")
               ("PS1"              . ,(literal-string "\[\e[92m\]\u\[\e[0m\]@\[\e[94m\]\H\[\e[0m\]:\[\e[97m\]\w\[\e[0;5m\]\$\[\e[0m\] ")) ;; Add Error Code when =/ 0, Git status
               ("PS2"              . ,(literal-string "\[\e[90;3m\]\t\[\e[0;37;5m\]\$\[\e[0m\] "))
               ("TMOUT"            . "898"))))
            (service home-dotfiles-service-type
              (home-dotfiles-configuration
                (directories '("../gnu/home/services/config"))))
            (service home-shepherd-service-type
              (home-shepherd-configuration
               (services
                (list
                  (shepherd-service
                    (provision '(emacs))
                     (start #~(make-system-constructor "emacs --daemon"))
                     (stop #~(make-system-constructor "emacsclient --eval '(kill-emacs)'")))))))
            (service unattended-upgrade-service-type))))

;;; home.scm ends here
