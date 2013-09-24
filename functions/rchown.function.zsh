function rchown() {
    if [ $# != 2 ]; then
        echo "Recursively change the owner of files and directories. Usage: chown <pattern> <owner>"
    else
        find "$1" -exec chown "$2" {} +
    fi
}
