;; This "home-environment" file can be passed to 'guix home reconfigure'
;; to reproduce the content of your profile.  This is "symbolic": it only
;; specifies package names.  To reproduce the exact same profile, you also
;; need to capture the channels being used, as returned by "guix describe".
;; See the "Replicating Guix" section in the manual.

;;; Code:

(use-modules
  (gnu home) 
  (gnu home services) 
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
               '(("cp" . "rsync --archive --human-readable --info=progress2 --progress --verbose --info=progress2")
                 ("curl" . "curl --verbose")
                 ("dd" . "dd status=progress")
                 ("df" . "df --human-readable")
                 ("dir" . "dir --all --color=auto --dired --human-readable -v")
                 ("egrep" . "egrep --color=auto")
                 ("emacs" . "emacsclient --alternate-editor --create-frame --no-wait")
                 ("fgrep" . "fgrep --color=auto")
                 ("free" . "free --human")
                 ("grep" . "grep --color=auto")
                 ("ls" . "ls --all --color=auto --dired --human-readable -v")
                 ("logout" . "pkill emacsclient & logout")
                 ("mkdir" . "mkdir --parents --verbose")
                 ("mv" . "rsync --archive --human-readable --info=progress2 --progress --remove-source-files --verbose")
                 ("nc" . "socat -,rawer,escape=0x1d tcp:")
                 ("rm" . "rm --interactive --verbose")
                 ("vdir" . "vdir --all --color=auto --dired --human-readable -v")
                 ("wget" . "wget --show-progress")))
              (environment-variables
                 ("EDITOR" . ,(file-append emacs "/bin/emacsclient --alternate-editor --create-frame --no-wait"))
                 ("HISTCONTROL" . ,("ignoreboth"))
                 ("HISTFILESIZE" . ,("4096"))
                 ("HISTSIZE" . ,("4096"))
                 ("SHELL" . ,(file-append xonsh "/bin/xonsh"))
                 ("VISUAL" . ,(file-append emacs "/bin/emacsclient --alternate-editor --create-frame --no-wait")))))
            (service home-shepherd-service-type
              (home-shepherd-configuration
               (services
                (list
                  (shepherd-service
                    (provision '(emacs))
                    (start #~(make-system-constructor "emacs --daemon"))
                     (stop #~(make-system-constructor "emacsclient --eval '(kill-emacs)'"))
                  (service unattended-upgrade-service-type)))))))))

;;; home.scm ends here
