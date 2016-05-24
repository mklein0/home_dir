#!/usr/bin/false

# enable color support of ls and also add handy aliases
# If MAC OSX?
if [ "$(uname -s)" == "Darwin" ]; then
	# If brew gnu ls available use that instead
	if [ -x /usr/local/bin/gls ]; then
    alias ls='gls --color=auto'
	fi

# Else Assume linux
elif [ -x /usr/bin/dircolors ]; then
    # setup dircolors
    #test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
