#Builds a list of executable programs in order of path precidence and outputs the full path for each.
function listprogs () {
    for entry in $path
    do
        print -l $entry/*(*)
    done
}
