#Output a list of all executables that appear in your $PATH more than once.
function finddupprogs() {
    typeset -a programs
    for entry in $path
    do
        programs+=($entry/*(*:t))
    done
    programs=(${(o)programs})

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

    print -l $programs
}
