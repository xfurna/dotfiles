#!/bin/bash
IFS='
'
file_list=($(ls /hdd/Documents/Notes)) # sunbstitute the with your local Notes directory
file_count=(${#file_list[*]})
 echo "${file_list[*]}"
nonote=0
for (( i=0; i<${file_count}; i=$i+1))
do
    if [ ${file_list[${i}]} != "$((${i}-${nonote}))newnote.md" ] 
    then
        nonote=$((${nonote}+1))
        if [[ ! ${file_list[${i}]::1} =~ [0-9]+ ]]; then
                break
        fi
    fi
done
newnote="$((${i}-${nonote}+1))newnote.md"
touch "/hdd/Documents/Notes/$newnote"
typora "/hdd/Documents/Notes/$newnote"

