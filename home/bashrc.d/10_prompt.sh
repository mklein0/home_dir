#!/usr/bin/false

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
	xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
	if [ -x /usr/bin/tput ] && tput setaf 1>/dev/null; then
		# We have color support; assume it's compliant with Ecma-48
		# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
		# a case would tend to support setf rather than setaf.)
		color_prompt=yes
	else
		color_prompt=
	fi
fi

if [ "$color_prompt" = yes ]; then
	#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]\$ '
else
	#PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
	PS1='${debian_chroot:+($debian_chroot)}\u@\h\$ '
fi
unset color_prompt force_color_prompt

__venv_ps1 () {
	local exitcode=$?
	local printf_format=' (%s)'

	case "$#" in
		0|1)  printf_format="${1:-$printf_format}"
		;;
		*)  return $exitcode
		;;
	esac

	if [ -z "${VIRTUAL_ENV}" ]; then
		return $exitcode
	fi

	local venvstring=$(basename ${VIRTUAL_ENV})

	printf -- "$printf_format" "$venvstring"
	return $exitcode
}

# If this is an xterm set the window title
case "$TERM" in
	xterm*|rxvt*)
		# Update console title each prompt with virtualenv
		_title='\[\e]0;$(declare -F __venv_ps1 &> /dev/null && __venv_ps1 "(venv: %s) ")$(declare -F __git_ps1 &>/dev/null && __git_ps1 "(git: %s) ")${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]'
		PS1="$_title$PS1"
		unset _title
		;;
	*)
		;;
esac
