
#!/bin/bash

program="git"
condition=$(which $program 2>/dev/null | grep -v "not found" | wc -l)
if [ $condition -eq 0 ] ; then
    echo "$program is not installed. Please install $program on your system."
fi

program="gitlab"
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
      cd ~/Desktop/GitLabRepo/
      echo "The following keys were found"
      echo
      file * | grep RSA
      found="$(file * | grep RSA | wc -l)"
      echo -e "Total: $found keys"
      echo
	if [[ "$found" == "0" ]]; then
		read -p "Enter the name you would like to set up:  " ufname
		git config --global user.name "$ufname"
		read -p "Enter the email id to be associated with gitlab account: " email
		git config --global user.email "$email"
    		echo 'Enter your GitLab username: '
    		read u
    		echo 'Enter your GitLab password: '
    		read -s p
	


    echo 'Generating GitLab authentication key ...'
    cd ~/Desktop/
    mkdir GitLabRepo
    cd ~/Desktop/GitLabRepo/
    ssh-keygen -t rsa -b 4096 -C '$u' -P "" -f 'gitLabCLIKeys'


    echo 'Authorising key for use with GitLab ...'
    CFG='\nHost gitlab.com\n  HostName gitlab.com\n  User "$u"\n  IdentityFile ~/.ssh/gitLabCLIKeys'
    echo -e $CFG >>~/.ssh/config
    chmod 400 ~/Desktop/GitLabRepo/gitLabCLIKeys
    echo 'Finished configuring keys ... '
    cat ~/.ssh/gitLabCLIKeys.pub
    echo "Copying the key above to your GitLab settings to authorise your username"

    # Call python script to copy the ssh key generated to server
    chmod u+x ~/Desktop/BitBucket-GDP/gitsubmit_cli/MainModule/newuploadssh.py
    python ~/Desktop/BitBucket-GDP/gitsubmit_cli/MainModule/newuploadssh.py ~/Desktop/GitLabRepo/gitLabCLIKeys.pub

	
    # Initiate Clone process
    echo "Your repository will be cloned to the following path: ~/Desktop/GitLabRepo/"
    cd ~/Desktop/GitLabRepo/
    echo
    echo "Initiating Clone process of your repository........."
    echo
    #GIT_SSH_COMMAND="ssh -i ~/.ssh/gitLabCLIKeys -F /dev/null" git clone git@cs$
    #ssh-agent sh -c "ssh-add ~/Desktop/GitLabRepo/gitLabCLIKeys; git clone $res$
        chmod u+x ~/Desktop/BitBucket-GDP/gitsubmit_cli/MainModule/updatedgetprojects.py
        python ~/Desktop/BitBucket-GDP/gitsubmit_cli/MainModule/updatedgetprojects.py
        URL="$(cat /tmp/repoReturn.txt)"
	#URL=cat /tmp/repoReturn.txt | 
        GIT_SSH_COMMAND="ssh -i ~/Desktop/GitLabRepo/gitLabCLIKeys -F /dev/null" git clone git@csgrad06.nwmissouri.edu:root/Lalit-cli.git  
	

 
else
    read -p "Would you like to use the existing keys for authentication (yes or no) ? : " response
    if [[ "$response" == "yes" ]]; then
        echo " Thank you. We will proceed with authentcation using the existing keys"
        echo
        # This is where the python script to clone and search would be used
        chmod u+x ~/Desktop/BitBucket-GDP/gitsubmit_cli/MainModule/newuploadssh.py
        python ~/Desktop/BitBucket-GDP/gitsubmit_cli/MainModule/newuploadssh.py ~/Desktop/GitLabRepo/gitLabCLIKeys.pub
        echo "Your repository will be cloned to the following path: ~/Desktop/GitLabRepo/"
        cd ~/Desktop/GitLabRepo/
        echo
        echo "Initiating Clone process of your repository........."
        echo
        #GIT_SSH_COMMAND="ssh -i ~/.ssh/gitLabCLIKeys -F /dev/null" git clone git@cs$
        #ssh-agent sh -c "ssh-add ~/Desktop/GitLabRepo/gitLabCLIKeys; git clone $res$
        chmod u+x ~/Desktop/BitBucket-GDP/gitsubmit_cli/MainModule/updatedgetproject$
        python ~/Desktop/BitBucket-GDP/gitsubmit_cli/MainModule/updatedgetprojects.py
        URL="$(cat /tmp/repoReturn.txt)"
        GIT_SSH_COMMAND="ssh -i ~/Desktop/GitLabRepo/gitLabCLIKeys -F /dev/null" git clone git@csgrad06.nwmissouri.edu:root/Lalit-cli.git  


    else
        echo 'Generating GitLab authentication key ...'
	cd ~/Desktop/GitLabRepo/
        ssh-keygen -t rsa -b 4096 -C '$u' -P "" -f 'gitLabCLIKeys'

        echo 'Authorising key for use with GitLab ...'
        CFG='\nHost gitlab.com\n  HostName gitlab.com\n  User "$u"\n  IdentityFile ~/.ssh/gitLabCLIKeys'
        echo -e $CFG >> ~/.ssh/config
        chmod 400 ~/Desktop/GitLabRepo/gitLabCLIKeys

        echo 'Finished configuring keys ... '

        cat ~/.ssh/gitLabCLIKeys.pub
        echo "Copying the ssh key to your gitlab account..........."
        # Call python script to copy the ssh key generated to server
        chmod u+x ~/Desktop/BitBucket-GDP/gitsubmit_cli/MainModule/newuploadssh.py
	python ~/Desktop/BitBucket-GDP/gitsubmit_cli/MainModule/newuploadssh.py ~/Desktop/GitLabRepo/gitLabCLIKeys.pub
	echo "Your repository will be cloned to the following path: ~/Desktop/GitLabRepo/"
	cd ~/Desktop/GitLabRepo/
	echo
        echo "Initiating Clone process of your repository........."
	echo
	#GIT_SSH_COMMAND="ssh -i ~/.ssh/gitLabCLIKeys -F /dev/null" git clone git@csgrad06.nwmissouri.edu:S525729/Lalit-cli-test.git
	#ssh-agent sh -c "ssh-add ~/Desktop/GitLabRepo/gitLabCLIKeys; git clone $result" 
        chmod u+x ~/Desktop/BitBucket-GDP/gitsubmit_cli/MainModule/updatedgetprojects.py
        python ~/Desktop/BitBucket-GDP/gitsubmit_cli/MainModule/updatedgetprojects.py
	URL="$(cat /tmp/repoReturn.txt)"
	GIT_SSH_COMMAND="ssh -i ~/Desktop/GitLabRepo/gitLabCLIKeys -F /dev/null" git clone git@csgrad06.nwmissouri.edu:root/Lalit-cli.git
fi;
fi;
