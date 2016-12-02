#!/bin/bash
echo "Welcome to GitSubmit Command Line Interface "
echo
echo
echo "Please wait while we check for existing keys for authentication"
echo
read -p 'Provide the path of the directory where you would store your keys, i.e, the location of .ssh folder on your system: ' target
#name = '*.pub'

if [ ! "$(ls -A $target)" ]; then
    echo -e "Directory $target is empty"
    exit 0
fi
# use file command to find public keys
# file * | grep RSA | wc -l | countKeys
found=0
while read line; do
    found=$[found+1]
    echo -e "Found: $line"
done < <(find "$target" -iname "*.pub" )

if [[ "$found" == "0" ]]; then
    echo -e "No match for files with .pub extension"
    echo "We will now generate the keys required for authentication"
    # we need to move to home folder to make the.ssh folder
    cd $target
    mkdir ~/.ssh
    chmod 700 ~/.ssh
    ssh-keygen -t rsa
else
    echo -e "Total: $found elements"
fi
