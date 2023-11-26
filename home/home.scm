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
               ("cd" . "cd $@ && ls --almost-all -c --color=auto --human-readable --indicator-style -v")
               ("cp" . "rsync --archive --human-readable --info=progress2 --progress --verbose")
               ("curl" . "curl --verbose")
               ("dd" . "dd status=progress")
               ("df" . "df --human-readable")
               ("dir" . "emacsclient --alternate-editor --create-frame --eval '(list-directory)' --no-wait")
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
                bind '"\C-n": history-search-forward'
                ### ARCHIVE EXTRACTION
                # usage: ex <file>
                ex ()
                {
                  if [ -f $1 ] ; then
                    case $1 in
                      *.tar.bz2   tar xjf $1   ;;
                      *.tar.gz    tar xzf $1   ;;
                      *.bz2       bunzip2 $1   ;;
                      *.rar       unrar x $1   ;;
                      *.gz        gunzip $1    ;;
                      *.tar       tar xf $1    ;;
                      *.tbz2      tar xjf $1   ;;
                      *.tgz       tar xzf $1   ;;
                      *.zip       unzip $1     ;;
                      *.Z         uncompress $1;;
                      *.7z        7z x $1      ;;
                      *.deb       ar x $1      ;;
                      *.tar.xz    tar xf $1    ;;
                      *.tar.zst   unzstd $1    ;;
                      *           echo "'$1' cannot be extracted via ex()" ;;
                    esac
                  else
                    echo "'$1' is not a valid file"
                  fi
                }
                
                # f --- Use emacsclient and stand-alone elisp functions in a pipe

                # Usage example:

                # echo "you are not kidding" | f -e ~/bin/replace-my-regexp.el "replace-my-regexp" "are not" "ain’t"

                # Output: you ain’t kidding

                # Reminder: use single quotes instead of double quotes for regexps
                # with backslashes in them to make formatting convenient!

                # Notes:

                # • we just throw away -e and always:
                #  • load the code in the path specified by f’s second argument
                #  • run the function named by f’s third argument,
                #    • passing it the remaining arguments as data

                # For reasons of encapsulation we assume that the function actually
                # resides in the "f/" namespace.  For example,
                # ~/bin/replace-my-regexp.el has contents:

                # (defun f/replace-my-regexp (a b)
                #   (goto-char (point-min))
                #   (while (re-search-forward a nil t)
                #     (replace-match b))
                #   (buffer-substring-no-properties (point-min) (point-max)))

                # In addition, we unbind f/-functions after we use them with
                # `fmakunbound', so that your Emacs server isn’t cluttered.

                # Code:

                oldIFS="$IFS"
                IFS=$'😃'

                # designate a temporary file
                TMP="$(mktemp /tmp/stdin-XXX)"
                # write input to temporary file
                cat >$TMP
                # open the temporary file in emacs
                emacsclient -a emacs -n $TMP
                # load and run commands, as specified, on the contents of the temporary file
                # (suppressing messages, as well as capturing and suppressing the final output)

                OUT=`emacsclient -a emacs -e "(progn (set-buffer (get-buffer (substring \"$TMP\" 5)))"\
                "(let* ((inhibit-message t) (message-log-max nil)"\
                "(args (split-string \"$*\" \"😃\"))"\
                "(f (intern (concat \"f/\" (third args))))"\
                "(ret (progn (load (second args)) (apply f (nthcdr 3 args)))))"\
                "(save-buffer)"\
                "(kill-buffer (current-buffer))"\
                "(fmakunbound f)"\
                ")))"`

                # cat the contents of the temporary file to standard out
                cat $TMP
                rm $TMP
                IFS="$oldIFS"
                \n")
              (environment-variables
                ("EDITOR" . ,(file-append emacs "/bin/emacsclient --alternate-editor --create-frame --no-wait"))
                ("HISTCONTROL" . "ignoreboth")
                ("HISTFILESIZE" . "4096")
                ("HISTSIZE" . "4096")
                ("PAGER" . ,(file-append emacs "/bin/emacsclient --alternate-editor --create-frame --no-wait"))
                ("PS1" . "\u@\H:\W\> ") ;; Add Error Code when =/ 0, Git status
                ("PS2" . "\t\> ") ;; Add Error Code when =/ 0
                ("PS3" . "\t\> ")
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
