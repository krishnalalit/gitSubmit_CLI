#!/bin/bash

remoteHost=bitbucket.com
remoteUser=username
remoteDir="~/repositories/"
remoteRepos=$(ssh -l $remoteUser $remoteHost "ls $remoteDir")
localCodeDir="${HOME}/CODE/"

# if no output then exit
if [ -z "$remoteRepos" ]; then
    echo "No results from remote repo listing (via SSH)"
    exit
fi

for gitRepo in $remoteRepos
do
  localRepoDir=$(echo ${localCodeDir}${gitRepo}|cut -d'.' -f1)
  if [ -d $localRepoDir ]; then
		echo -e "Directory $localRepoDir already exits, skipping ...\n"
	else
		cC="git clone ssh://$remoteUser@$remoteHost/$remoteDir"
		cC=$cC"$gitRepo $localRepoDir"

		ccRun=$($cC 2>&1)

		echo -e "Running: \n$ $cC"
		echo -e "${ccRun}\n\n"
	fi
done
