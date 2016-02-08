#!false

#alias ll='ls -l'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    # setup dircolors
    #test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

elif [ "`uname -s`" == "Darwin" -a -x /usr/local/bin/gls ]; then

    alias ls='gls --color=auto'

fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
