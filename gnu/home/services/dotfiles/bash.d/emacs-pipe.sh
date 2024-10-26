# f --- Use emacsclient and stand-alone elisp functions in a pipe

# Usage example:

# echo "hello world" | f -e ~/bin/replace-my-regexp.el "replace-my-regexp" "world" "darkness my old friend"

# Output: hello darkness my old friend

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