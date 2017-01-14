#!/bin/bash
echo "Welcome to GitSubmit Command Line Interface "
echo
echo
echo "Please wait while we check for existing keys for authentication"
echo

# use file command to find public keys
cd ~/
echo " The following number of keys were found: "
found="$(file * | grep RSA | wc -l)"
echo
if [[ "$found" == "0" ]]; then
    echo -e "Could not find any usable keys"
    echo "We will now generate the keys required for authentication"
    # we need to move to home folder to make the.ssh folder
    mkdir ~/.ssh
    chmod 700 ~/.ssh
    ssh-keygen -t rsa
else
    echo "The following keys were found"
    file * | grep RSA
    echo -e "Total: $found keys"
    echo
    read -p "Would you like to use the existing keys for authentication (yes or no) ?" response
    echo
    if [[ "$response" == "yes" ]]; then
      echo " Thank you. We will proceed with authentcation using the existing keys"
      echo
    else
      mkdir ~/.ssh
      chmod 700 ~/.ssh
      ssh-keygen -t rsa
    fi;
fi;
#repo="git@bitbucket.org:knklalit/authdemorepo.git"
#pathLoc="~/"
#git clone "$repo" "$pathLoc"
echo "Authentication complete"




#cd authdemorepo
#echo "# My project's README" >> README.md git add README.md
#git commit -m "Initial commit"
#git push -u origin master