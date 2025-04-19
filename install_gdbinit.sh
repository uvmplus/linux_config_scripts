#!/bin/bash
set -euo pipefail


curl -L -o ~/".gdbinit" https://github.com/cyrus-and/gdb-dashboard/raw/master/.gdbinit

pip install pygments