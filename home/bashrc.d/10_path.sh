#!/bin/false

# List of paths to add.
#  ex. _paths=(dir0 dir1 ... dirn)
declare -a _paths
_paths=(/opt/android-sdk-linux_x86-1.0_r2/tools ${HOME}/bin)

# If path not there, add it.
for _path in ${_paths[@]}
do
    # Directory exists
    if [ -d ${_path} ]; then
        # If directory not part of path prepend it.
        if echo $PATH | perl -ne "exit(-1) if m:${_path}:;"; then
          PATH=${_path}:${PATH}
      fi
    fi
done
export PATH

unset _paths
unset _path
