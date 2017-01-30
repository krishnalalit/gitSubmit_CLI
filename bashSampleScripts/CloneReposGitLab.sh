#!/bin/bash


X='\033[0;34m'
Y='\033[0;32m'
Z='\033[0m'

printf "${X}Initializing starting sciprt${Y} Pulling from code.mydomain.com${Z}\n"

#var's
codeHost=mydomain.com
codeUser=admin
testApp1="git@$codeHost:$codeUser/testapp1.git"
testApp2="git@$codeHost:$codeUser/testapp2.git"
testApp3="git@$codeHost:$codeUser/testapp3.git"
testApp4="git@$codeHost:$codeUser/testapp4.git"
testApp5="git@$codeHost:$codeUser/testapp5.git"

#this is the part I'm not sure about for checking to make sure the project exist
codeProjects="$tesApp1" && "$tesApp2" && "$tesApp3" && "$tesApp4" && "$tesApp5"


localCodeDir="${HOME}/code/"


do
   #once again im not sure if this works to check $codeprojects variable  if it exist or not.
   if [ -z "$codeProjects" ]; then
      echo "Project not found"
      exit
   else # this is where I am confused on how to make loop through each project ********
      cloneCmd="git clone $testApp1"
      cloneCmd="git clone $testApp2"
      cloneCmd="git clone $testApp3"
      cloneCmd="git clone $testApp4"
      cloneCmd="git clone $testApp5"
   fi
done
