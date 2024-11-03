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
               ("cp" . "rsync --archive --human-readable --info=progress2 --progress --verbose")
               ("curl" . "curl --verbose")
               ("dd" . "dd status=progress")
               ("df" . "df --human-readable")
               ("dir" . "emacsclient --alternate-editor --create-frame --eval '(list-directory)' --no-wait")
               ("docker" . "podman")
               ("emacs" . "emacsclient --alternate-editor --create-frame --no-wait")
               ("find-file" . "emacsclient --alternate-editor --create-frame --no-wait")
               ("grep" . "grep --color=auto")
               ("ll" . "ls --all --color=auto --dired --human-readable --indicator-style -l -v")
               ("ls" . "ls --almost-all --color=auto --dired --human-readable --indicator-style -v")
               ("logout" . "emacsclient --eval '(server-delete-client)' & logout")
               ("mkdir" . "mkdir --parents --verbose")
               ("mv" . "rsync --archive --human-readable --info=progress2 --progress --remove-source-files --verbose")
               ("nc" . "socat -,rawer,escape=0x1d tcp:$@")
               ("patch" . "patch --backup --verbose")
               ("ping" . "ping -v")
               ("ping6" . "ping6 -v")
               ("ps" . "ps --forest")
               ("rm" . "rm --interactive --one-file-system --verbose")
               ("sudo-emacs" . "sudoedit")
               ("sudo-find-file" . "sudoedit")
               ("vdir" . "emacsclient --alternate-editor --create-frame --eval '(dired)' --no-wait"))
              (bashrc
               "\
                set colored-completion-prefix on
                set colored-stats on
                set completion-ignore-case on
                set show-all-if-ambiguous on
                set skip-completed-text on
                shopt -s checkwinsize
                shopt -s histappend
                shopt -s autocd # change to named directory
                shopt -s cdspell # autocorrects cd misspellings
                shopt -s cmdhist # save multi-line commands in history as single line
                ### BINDS
                stty -ixon # Disable ctrl-s and ctrl-q
                bind '"\C-p": history-search-backward'
                bind '"\C-n": history-search-forward')
              (environment-variables
                ("EDITOR" . ,(file-append emacs "/bin/emacsclient --alternate-editor --create-frame --no-wait"))
                ("HISTCONTROL" . "ignoreboth")
                ("HISTFILESIZE" . "4096")
                ("HISTSIZE" . "4096")
                ("PAGER" . ,(file-append emacs "/bin/emacsclient --alternate-editor --create-frame --no-wait"))
                ("PS1" . "\[\e[91m\]\u\[\e[0m\]@\[\e[92m\]\H\[\e[0m\]:\[\e[94m\]\w\[\e[0;5m\]𝛌\[\e[0m\] ") ;; Add Error Code when =/ 0, Git status
                ("PS2" . "\[\e[3m\]\t\[\e[0;5m\]>\[\e[0m\] ")
                ("PS3" . "\t? ")
                ("PS4" . "\> ")
                ("VISUAL" . ,(file-append emacs "/bin/emacsclient --alternate-editor --create-frame --no-wait")))
            (service home-shepherd-service-type
              (home-shepherd-configuration
               (services
                (list
                  (shepherd-service
                    (provision '(emacs))
                     (start #~(make-system-constructor "emacs --daemon"))
                     (stop #~(make-system-constructor "emacsclient --eval '(kill-emacs)'")))
                  (service unattended-upgrade-service-type))))))))))

;;; home.scm ends here
