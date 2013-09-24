function rchgrp() {
    if [ $# != 2 ]; then
        echo "Recursively change the group for files and directories. Usage: chown <pattern> <owner>"
    else
        find "$1" -exec chown ":$2" {} +
    fi
}
