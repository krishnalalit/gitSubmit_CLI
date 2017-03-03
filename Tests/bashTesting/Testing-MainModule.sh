#!/bin/bash

program="git"
condition=$(which $program 2>/dev/null | grep -v "not found" | wc -l)
if [ $condition -eq 0 ] ; then
    echo "$program is not installed. Please install $program on your system."
fi

program="python"
condition=$(which $program 2>/dev/null | grep -v "not found" | wc -l)
if [ $condition -eq 0 ] ; then
    echo "$program is not installed. Please install $program on your system."
fi


echo
echo
echo "Welcome to GitSubmit Command Line Interface "
      echo
      echo

echo "Please wait while we check for existing keys, for authentication"
      echo
      cd /c/Users/S525729/.ssh/
      echo "The following keys were found"
      file * | grep RSA
      found="$(file * | grep RSA | wc -l)"
      echo -e "Total: $found keys"
      echo

if [[ "$found" == "0" ]]; then
	read -p "Enter the name you would like to set up " ufname
	git config --global user.name "$ufname"
	read -p "Enter the email id to be associated with gitlab account" email
	git config --global user.email "$email"
    echo 'Enter your GitLab username: '
    read u
    echo 'Enter your GitLab password: '
    read -s p
	
    echo 'Generating GitLab authentication key ...'
    ssh-keygen -t rsa -b 4096 -C "$u" -P "" -f '/c/Users/S525729/.ssh/gitLabCLIKeys'

    echo 'Authorising key for use with GitLab ...'
    CFG='\nHost gitlab.com\n  HostName gitlab.com\n  User git\n  IdentityFile /c/Users/S525729/.ssh/gitLabCLIKeys'
    echo -e $CFG >>/c/Users/S525729/.ssh/config
    chmod 400 /c/Users/S525729/.ssh/gitLabCLIKeys

    echo 'Finished configuring keys ... '

    cat /c/Users/S525729/.ssh/gitLabCLIKeys.pub
    echo '^ Copy the key above in your GitLab settings to authorise your username'
	# Call python script to copy the ssh key generated to server
    chmod u+x /c/Users/S525729/Google\ Drive/Semester-3/GDP-1/gitsubmit_cli/Tests/bashTesting/hello.py
    python /c/Users/S525729/Google\ Drive/Semester-3/GDP-1/gitsubmit_cli/Tests/bashTesting/hello.py

else
    read -p "Would you like to use the existing keys for authentication (yes or no) ?" response
    if [[ "$response" == "yes" ]]; then
        echo " Thank you. We will proceed with authentcation using the existing keys"
        echo
        # This is where the python script to clone and search would be used
        read -p "Enter the subject your repository belongs to: " subject
        read -p "Enter the topic of the repository to be cloned: " topic
        #result=`python ~/gitLabCLI/cloning.py "$subject" "$topic"`
        # read -p "Enter the path, where you would like to clone your repository: " path
        cd /c/Users/S525729/cloneTest/
        git clone git@csgrad06.nwmissouri.edu:S525729/Lalit-cli-test.git

    else
        echo 'Generating GitLab authentication key ...'
        ssh-keygen -t rsa -b 4096 -C "$u" -P "" -f '/c/Users/S525729/.ssh/gitLabCLIKeys'

        echo 'Authorising key for use with GitLab ...'
        CFG='\nHost gitlab.com\n  HostName gitlab.com\n  User git\n  IdentityFile /c/Users/S525729/.ssh/gitLabCLIKeys'
        echo -e $CFG >> /c/Users/S525729/.ssh/config
        chmod 400 /c/Users/S525729/.ssh/gitLabCLIKeys

        echo 'Finished configuring keys ... '

        cat /c/Users/S525729/.ssh/gitLabCLIKeys.pub
        echo '^ Copy the key above in your GitLab settings to authorise your username'
        # Call python script to copy the ssh key generated to server
        chmod u+x /c/Users/S525729/Google\ Drive/Semester-3/GDP-1/gitsubmit_cli/Tests/bashTesting/hello.py
		python /c/Users/S525729/Google\ Drive/Semester-3/GDP-1/gitsubmit_cli/Tests/bashTesting/hello.py
		
		cd /c/Users/S525729/cloneTest/
        git clone git@csgrad06.nwmissouri.edu:S525729/Lalit-cli-test.git
fi;
fi;
