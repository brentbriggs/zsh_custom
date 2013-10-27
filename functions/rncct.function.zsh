# Renames files or directories by their mac content creation date.
function macrnbycctime() {
    if [[ $# < 1 ]]; then
        print "Rename files by their OSX content creation date. Usage  macrnbyccdate <pattern>"
    else

        for i do
            #Get content creation date and time.
            ccinfo=(${=$(mdls -name kMDItemContentCreationDate $i)})

            #Create the root filename.
            basename=${ccinfo[3]//"-"/""}"_"$ccinfo[4]
            
            #Rename the file if it is not already named by it's content creation date.
            if [[ $i != $basename* ]]; then
                #Check if the new filename already exists. 
                if [[ -a $basename.$i:e ]]; then
                    # If the new filename already exists add a number to the end of the root name.
                    typeset -i inc=1
                    while [[ -a $basename"_"$inc.$i:e ]]; do
                        (( inc++ )) 
                    done
                    basename+="_"$inc
                fi
                
                #Create the new filename.
                newfilename=$basename"."$i:e

                #Move the original file to the new filename.
                mv $i $newfilename
            fi

        done
    fi
}

