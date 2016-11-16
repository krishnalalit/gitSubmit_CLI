#!/bin/bash
#The character hash and exclamation above is called a SHEBANG. It means that the script should always be run with bash, rather than another shell.
# Hash is used to write comments
# This script helps in listing out all files first and then moving them by giving argument while running the script
# ./simpleList script /file1.txt /c/Users/s525729/GoogleDrive/
ls -la
mv $1 $2

# verifying if listing worked
 echo Details for $2
 ls -la $2
### $USER - The username of the user running the script.
### $HOSTNAME - The hostname of the machine the script is running on.
### $SECONDS - The number of seconds since the script was started

env
# listing of other variables which you may also refer to.
