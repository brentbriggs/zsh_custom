#Builds a list of executable programs in order of path precidence and outputs the full path for each.
function listpgms () {

    programs=$(find ${=${(s/:/)${PATH}}} -type f -perm +111)

    print $programs
}
