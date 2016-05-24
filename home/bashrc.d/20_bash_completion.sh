#!/usr/bin/false

# If Mac, check for brew
type brew 1>/dev/null 2>/dev/null
if [ $? -eq 0 -a -f $(brew --prefix)/etc/bash_completion ]; then
	. $(brew --prefix)/etc/bash_completion

elif [ ! -r /etc/bash_completion ]; then
	if [ -z "${BASH_COMPLETION_DIR}" ]; then
		# No bash completion run ours
		[ -n "${BASH_COMPLETION}" ] || BASH_COMPLETION=${HOME}/.bash_completion.d/.bash_completion

		. ${BASH_COMPLETION}
	fi
fi
