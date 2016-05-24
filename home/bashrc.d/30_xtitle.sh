#!/bin/false

if [[ "`uname`" == "Darwin" || $TERM == "xterm" ]]; then

function xtitle() {
	echo -ne "\e]0;$@\a"
}

else
function xtitle() {
	echo -n
}

fi
