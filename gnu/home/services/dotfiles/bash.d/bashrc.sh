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
shopt -s expand_aliases
### BINDS
stty -ixon # Disable ctrl-s and ctrl-q
bind '"\C-p": history-search-backward'
bind '"\C-n": history-search-forward')