#!/bin/bash
echo
echo
echo "Welcome to GitSubmit Command Line Interface "
      echo
      echo

echo "Please wait while we check for existing keys, for authentication"
      echo
      echo "The following keys were found"
      file * | grep RSA
      found="$(file * | grep RSA | wc -l)"
      echo -e "Total: $found keys"
      echo

if [[ "$found" == "0" ]]; then
    echo 'Enter your GitLab username: '
    read u
    echo 'Enter your GitLab password: '
    read -s p

    echo 'Generating GitLab authentication key ...'
    ssh-keygen -t rsa -b 4096 -C "$u" -P "" -f '~/.ssh/gitLabCLIKeys'

    echo 'Authorising key for use with GitLab ...'
    CFG='\nHost gitlab.com\n  HostName gitlab.com\n  User git\n  IdentityFile ~/.ssh/gitLabCLIKeys'
    echo -e $CFG >> /home/ubuntu/.ssh/config
    chmod 400 /home/ubuntu/.ssh/ssh_git

    echo 'Finished configuring keys ... '

    cat /home/ubuntu/.ssh/ssh_git.pub
    echo '^ Copy the key above in your GitLab settings to authorise your username'

else
    read -p "Would you like to use the existing keys for authentication (yes or no) ?" response
    if [[ "$response" == "yes" ]]; then
        echo " Thank you. We will proceed with authentcation using the existing keys"
        echo
        # This is where the python script to clone and search would be used
    else
        echo 'Generating GitLab authentication key ...'
        ssh-keygen -t rsa -b 4096 -C "$u" -P "" -f '~/.ssh/gitLabCLIKeys'

        echo 'Authorising key for use with GitLab ...'
        CFG='\nHost gitlab.com\n  HostName gitlab.com\n  User git\n  IdentityFile ~/.ssh/gitLabCLIKeys'
        echo -e $CFG >> /home/ubuntu/.ssh/config
        chmod 400 /home/ubuntu/.ssh/ssh_git

        echo 'Finished configuring keys ... '

        cat /home/ubuntu/.ssh/ssh_git.pub
        echo '^ Copy the key above in your GitLab settings to authorise your username'
        # Call python script to copy the ssh key generated to server
fi;
