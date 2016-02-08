#!/bin/false

# Number Space
#
# 00 - this file
# 10 - Shell Environment variables
# 20 - System Package installation
# 30 - System Package configuration
# 40 - Custom Package installation
# 50 - Custom Package configuration
# 60 - Final Configuration
# 70 - Process Restarts
# 80 - Runtime Configurations
# 90 - Extra


# Loop through all shell setup scripts in this directory.  Skip stub script.
for f in $(command ls -1 `dirname ${BASH_SOURCE[0]}`/*.sh |
    command grep -ve "${BASH_SOURCE[0]}"
); do
    . $f
done
