#!/usr/bin/false

if type brew 1>/dev/null 2>/dev/null; then
	if [ -f $(brew --prefix)/etc/bash_completion ]; then
		. $(brew --prefix)/etc/bash_completion
	fi
fi
