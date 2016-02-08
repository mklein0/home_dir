#!/bin/false

function myem() {
    # Work around for Ubuntu Dapper (6.0.6)
    xset fp rehash

    if [ -n $DISPLAY ]; then
        command xemacs $@ & 
    else
        command xemacs -nw $@
    fi
}
