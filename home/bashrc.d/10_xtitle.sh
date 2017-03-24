#!/bin/false

if [[ "$(uname)" == "Darwin" || $TERM == "xterm" ]]; then

function xtitle() {
	echo -ne "\e]0;$@\a"
}

function xtitle_postcmd() {
	local host=$(hostname)
	local cmd="$@"
	echo -ne "\e]0;${host} @ CMD: ${cmd}\a"
	"$@";
}

function xtitle_execcmd() {
	local host=$(hostname)
	local cmd="$@"
	if [ -n "${cmd}" ]; then
		echo -ne "\e]0;${host} @ CMD: ${cmd}\a"
	fi
	command $cmd;
}

else

function xtitle() {
	echo -n
}

function xtitle_postcmd() {
	echo -n
}

function xtitle_execcmd() {
	command "$@";
}

fi
