#!/bin/bash

echo "Welcome to GitSubmit Command Line Interface "
echo
echo
echo "Please wait while we check for existing keys for authentication"
echo
echo "The following keys were found"
file * | grep RSA
echo -e "Total: $found keys"
echo
read -p "Would you like to use the existing keys for authentication (yes or no) ?" response
echo
echo 'Enter your GitLab username: '
read u
echo 'Enter your GitLab password: '
read -s p

echo 'Generating GitLab authentication key ...'
ssh-keygen -t rsa -b 4096 -C "$u" -P "" -f '/home/ubuntu/.ssh/ssh_git'

echo 'Authorising key for use with GitLab ...'
CFG='\nHost gitlab.com\n  HostName gitlab.com\n  User git\n  IdentityFile /home/ubuntu/.ssh/ssh_git'
echo -e $CFG >> /home/ubuntu/.ssh/config
chmod 400 /home/ubuntu/.ssh/ssh_git

echo 'Finished configuring keys ... '

cat /home/ubuntu/.ssh/ssh_git.pub
echo '^ Copy the key above in your GitLab settings to authorise your username'
