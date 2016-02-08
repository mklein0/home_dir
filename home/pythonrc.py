#!/usr/bin/env python

# Enable function/variable name completion
import sys
try:
    import readline
except ImportError:
    print('Module readline not available.')
else:
    import rlcompleter
    readline.parse_and_bind("tab: complete")
 
# Setup saved history 
def _setup_history():
    import os, atexit
    histfile = os.path.join(os.environ["HOME"], ".pyhist")
    try:
        readline.read_history_file(histfile)
    except IOError:
        pass
 
    atexit.register(readline.write_history_file, histfile)

    del os, atexit

#_setup_history()
del _setup_history

