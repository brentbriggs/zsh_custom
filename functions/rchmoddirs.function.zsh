function rchmoddirs() {
    if [ $# != 2 ]; then
        echo "Recursively chmod all dirs. Usage: chmoddirs <dir> <mode>"
    else
        print "Number Args:" $#
        find "$1" -type d -exec chmod "$2" {} +
    fi
}

