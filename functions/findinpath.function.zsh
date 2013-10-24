#Search the path for instances of named executables and displays their location. Used to resolve path conflicts,
function findinpath() {
    if [[ $# < 1 ]]; then
        print "Search the path for pattern matches. Usage: findpgminpath <pattern>"
    else
        #Search the path for occurances of each argument.
        typeset pattern
        for i do
            pattern=$i(N)
            print -l -- ${^path}/${~pattern}
        done
    fi
}
