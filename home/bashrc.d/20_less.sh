#!false

[ -z "${LESS}" ] && export LESS="-Rx 2"
if [ -z "${LESSPIPE}" ]; then
	LESSPIPE=lesspipe.sh
	if [ -x /usr/bin/lesspipe ]; then
		LESSPIPE=lesspipe

	elif [ -x ~/.lessfilter ]; then
		LESSPIPE=~/.lessfilter

	elif [ -x /usr/local/bin/src-hilite-lesspipe.sh ]; then
		LESSPIPE=src-hilite-lesspipe.sh

	else
		LESSPIPE=lesspipe.sh

	fi
	export LESSPIPE
fi
[ -z "${LESSOPEN}" ] && export LESSOPEN='| ${LESSPIPE} %s'
[ -z "${LESSCOLORIZER}" ] && export LESSCOLORIZER="pygmentize -P encoding=utf8"
