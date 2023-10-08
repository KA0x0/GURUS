all:
	if [ "$EUID" -eq 0]
	guix system reconfigure $(hostname)-config.scm
	else
	guix home reconfigure $(hostname)-manifest.scm
	fi