function rchmodfiles() {
    if [ $# != 2 ]; then
        echo "Recursively chmod all files. Usage: chmodfiles <dir> <mode>"
    else
        find "$1" -type f -exec chmod "$2" {} +
    fi
}
