#Search the path for instances of named executables and displays their location. Used to resolve path conflicts.
function findpgminpath() {
    if [[ $# < 1 ]]; then
        print "Search the path for instances of named executables. Usage: findpgminpath <files>"
    else
        #Store path entries into an array.
        path_entries=(${=${(s/:/)${PATH}}}) 
        
        #Search the path for occurances of each argument.
        for args do
            for entry in $path_entries
            do
                #If the executable exists in this path entry, print the file path.
                if [[ -x $entry"/"$args ]]; then
                    print $entry"/"$args
                fi
            done
        done
    fi
}
