#!/usr/bin/false

# Only enable bash completion if bash not in posix mode.
# Load system completion scripts
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# If Mac, check for brew
if type brew 1>/dev/null 2>/dev/null; then
	if [ -f $(brew --prefix)/etc/bash_completion ]; then
		. $(brew --prefix)/etc/bash_completion
	fi

elif [ ! -r /etc/bash_completion ]; then
	if [ -z "${BASH_COMPLETION_DIR}" ]; then
		# No bash completion run ours
		[ -n "${BASH_COMPLETION}" ] || BASH_COMPLETION=${HOME}/.bash_completion.d/.bash_completion

		. ${BASH_COMPLETION}
	fi
fi


if type kubectl 1>/dev/null 2>/dev/null; then
	# https://kubernetes.io/docs/tasks/tools/install-kubectl/#on-linux-using-bash
	source <(kubectl completion bash)
fi
