# Splits a string by a delimeter
function splitstringby() {
    if [[ $# != 2 ]]; then
        print -l "Split a string by a delimeter. Usage: splitstringby <string> <delimeter>"
    else
        string=$1
        delimeter=$2
        for x in $( echo $string | tr ${delimeter} "\n" )
        do
            echo $x
        done
    fi
}
