import os
import readline
import atexit

histfile = os.environ.get("HOME") + "/.cache/python_history"

try:
    readline.read_history_file(histfile)
except:
    pass

atexit.register(readline.write_history_file, histfile)
