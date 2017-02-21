#!/bin/bash

echo "Welcome to GitSubmit Command Line Interface "
      echo
      echo

echo "Please wait while we check for existing keys for authentication"
      echo
      echo "The following keys were found"
      file * | grep RSA
      found="$(file * | grep RSA | wc -l)"
      echo -e "Total: $found keys"
      echo

uname = "$(git config --global --list | wc -l)"
      if[["$uname" <=2]]; then
        read -p "Please set a username for your account" name
        git config --global user.name "$name"
        echo "This is the username you have entered: "
        git config --global user.name
        echo
        read -p "Please enter the email address you would like to associate with this account" email
        echo
        echo "This is the email you have entered: "
        git config --global user.email "$email"
      else
        echo
        echo "A username had already been set. The following are the details: "
        echo
        git config --global --list
      fi;

read -p "Would you like to use the existing keys for authentication (yes or no) ?" response
if [[ "$response" == "yes" ]]; then
      echo " Thank you. We will proceed with authentcation using the existing keys"
      echo
      # This is where the python script to clone and search would be used
else
      echo 'Generating GitLab authentication key ...'
      ssh-keygen -t rsa -b 4096 -C "$u" -P "" -f '/home/ubuntu/gitlabKeys/ssh_gitLabKey'
      # Call python script to copy the ssh key generated to server
fi;
