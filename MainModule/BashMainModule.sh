
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

program="pip"
condition=$(which $program 2>/dev/null | grep -v "not found" | wc -l)
if [ $condition -eq 0 ] ; then
    echo "$program is not installed. Please install $program on your system."
fi

function keyGen(){

	# Generation of key
	echo "Generating GitLab authentication key ....."
	cd ~/Desktop/
	mkdir GitLabRepo
	cd ~/Desktop/GitLabRepo/
	ssh-keygen -t rsa -b 4096 -C '$u' -P "" -f 'gitLabCLIKeys'

	# Getting to key to set with config file and changing permission of he key
	echo "Authorising key for use with GitLab ..... "
	CFG='\nHost gitlab.com\n  HostName gitlab.com\n  User "$u"\n  IdentityFile ~/.ssh/gitLabCLIKeys'
	echo -e $CFG >>~/.ssh/config
	chmod 400 ~/Desktop/GitLabRepo/gitLabCLIKeys
	cp ~/Desktop/GitLabRepo/{gitLabCLIKeys, gitLabCLIKeys.pub} ~/.ssh/
	echo "Finished configuring keys ..... "
	cat ~/.ssh/gitLabCLIKeys.pub
	echo "Copying the above key to your GitLab account for authorization ..... "

	# Call python script to copy the ssh key generated to server
	chmod u+x ~/Desktop/gitsubmit_cli/MainModule/newuploadssh.py
	python ~/Desktop/gitsubmit_cli/MainModule/newuploadssh.py ~/Desktop/GitLabRepo/gitLabCLIKeys.pub

}

function repoClone(){

	# Initiate Clone process
	echo
    	echo "Your repository will be cloned to the following path: ~/Desktop/GitLabRepo/"
    	cd ~/Desktop/GitLabRepo/
    	echo
	echo "Initiating Clone process of your repository ..... "
    	echo
    	#GIT_SSH_COMMAND="ssh -i ~/.ssh/gitLabCLIKeys -F /dev/null" git clone git@cs
    	#ssh-agent sh -c "ssh-add ~/Desktop/GitLabRepo/gitLabCLIKeys; git clone $res
    	chmod u+x ~/Desktop/gitsubmit_cli/MainModule/updatedgetprojects.py
    	python ~/Desktop/gitsubmit_cli/MainModule/updatedgetprojects.py
    	URL="$(cat /tmp/repoReturn.txt)"
      urlConverter;
	    #URL=cat /tmp/repoReturn.txt |
    	GIT_SSH_COMMAND="ssh -i ~/Desktop/GitLabRepo/gitLabCLIKeys -F /dev/null" git clone "$NEW_URL"

}

function urlConverter(){

    USER=`echo $URL | sed -Ene's#http://csgrad06.nwmissouri.edu/(.*)/(.*).git#\1#p'`
    #http://csgrad06.nwmissouri.edu/S525729/Lalit-cli-test.git
    #http://csgrad06.nwmissouri.edu/root/Lalit-cli.git
    REPO=`echo $URL | sed -Ene's#http://csgrad06.nwmissouri.edu/(.*)/(.*).git#\2#p'`
    #git@csgrad06.nwmissouri.edu:S525729/Lalit-cli-test.git
    NEW_URL="git@csgrad06.nwmissouri.edu:$USER/$REPO.git"

}

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
    		read -p 'Enter your GitLab username: ' u
    		read -s -p 'Enter your GitLab password: ' p
		keyGen;
		repoClone;


     else
    	read -p "Would you like to use the existing keys for authentication (yes or no) ? : " response
    	if [[ "$response" == "yes" ]]; then
        	echo " Thank you. We will proceed with authentcation using the existing keys"
        	echo
        	# This is where the python script to clone and search would be used
       		repoClone;


    	else
        	# Calling key generation function
		keyGen;
		#Calling clone function
		repoClone;

	fi;
     fi;
#end of program
