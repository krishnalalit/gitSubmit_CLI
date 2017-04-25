#!/bin/bash
#Asking User for his credentials

read -p 'Username: ' unameVar
# -p allows us to specify a prompt
read -sp 'Password: ' pwdVar
# -s make the input silent. Good for sensitive fields like password
echo
echo Thankyou $unameVar
