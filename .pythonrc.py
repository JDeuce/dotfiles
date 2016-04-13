#.pythonrc.py
# executed when you start an interactive python shell

import os
try:
    import readline
except ImportError:
    pass
else:
    # These 2 lines enable tab completion
    import rlcompleter
    readline.parse_and_bind("tab: complete")

    # This block to enable persistent history
    histfile = os.path.join(os.path.expanduser("~"), ".pyhist")
    try:
        readline.read_history_file(histfile)
        readline.set_history_length(1000)
    except IOError:
        pass

    import atexit
    atexit.register(readline.write_history_file, histfile)
