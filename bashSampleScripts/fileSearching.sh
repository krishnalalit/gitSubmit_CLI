#!/usr/bin/env bash
read -p 'Provide the path of the directory you would like to target your search at: ' target
read -p  'Enter the name of the file to be searched: ' name

if [ ! "$(ls -A $target)" ]; then
    echo -e "Directory $target is empty"
    exit 0
fi

found=0
while read line; do
    found=$[found+1]
    echo -e "Found: $line"
done < <(find "$target" -iname "*$name*" )

if [[ "$found" == "0" ]]; then
    echo -e "No match for $name"
else
    echo -e "Total: $found elements"
fi 
