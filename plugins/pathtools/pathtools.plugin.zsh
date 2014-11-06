#Search the path for instances of named executables and displays their location.
#Used to resolve path conflicts.
fip() {
    if [[ $# < 1 ]]; then
        print "Search the path for pattern matches. Usage: fip <pattern>"
    else
        #Search the path for occurances of each argument.
        typeset pattern
        for i do
            pattern=$i(N)
            print -l -- ${^path}/${~pattern}
        done
    fi
}
alias fip='noglob fip'

#Output a list of all executables that appear in your $PATH more than once.
lsdp() {
    #Determine what options are set.
    local opt
    local verbose=0
    while getopts v opt
    do
        case $opt in
            (v)
                verbose=1
                ;;
            (\?)
                print  "Invalid option. Usage: lsdp [-v]"
                return 1
                ;;
        esac
    done

    typeset -a programs
    for entry in $path
    do
        if [[ -d $entry ]] then
            programs+=($entry/*(:t))
        fi
    done
    programs=(${(o)programs})

    # Find the duplicates
    typeset -i counter
    for (( counter=1; $counter <= ${#programs}; counter++ ))
    do
        if [[ $programs[counter] == $programs[counter+1] ]] then
            while [[ $programs[counter] == $programs[counter+1] ]]
            do
                programs[counter+1]=()
            done
        else
            programs[counter]=()
            (( counter-- ))
        fi
    done

    if [[ $verbose -eq 1 ]] then
        for p in $programs
        do
            print -l $p:
            print -l "=========="
            print -l $(which -a ${p})
            print -l
        done
    else
        print -c $programs
    fi
}

#Prints out all programs in your path in order of path precidence.
lsp () {
    for entry in $path
    do
        if [[ -d $entry ]] then
            print -l $entry/*
        fi
    done
}
