#Output a list of all executables that appear in your $PATH more than once.
function finddupprogs() {
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
                print  "Invalid option. Usage: finddupprogs [-v]"
                return 1
                ;;
        esac
    done

    typeset -a programs
    for entry in $path
    do
        programs+=($entry/*(*:t))
    done
    programs=(${(o)programs})

    # Fid the duplicates
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
        print -l $programs
    fi

}
