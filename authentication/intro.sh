#!/bin/bash

clear

echo "Initializing GitSubmit Command Line Interface..."

echo "Welcome, $USER!"

echo "Is this the first time that you are using Command Line to Ineteract with GitLab ?"
read -p "Please respond with a 'Yes' or 'No' only " response

if [ $response = Yes || yes || y]
        then echo "Great, We will now begin the process of Authentication."
        else echo "Welcome back."

fi

