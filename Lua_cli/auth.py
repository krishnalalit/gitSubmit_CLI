import os
import getpass

username = raw_input("Please enter your gitlab username: ")
password = getpass.getpass()

print 'Generating GitLab authentication key ...'
keyGenCommand = 'ssh-keygen -t rsa -b 4096 -C ' + username + ' -P "" -f "/home/ubuntu/.ssh/ssh_git"'
os.system(keyGenCommand)

print 'Authorising key for use with GitLab ...'
CFG='\nHost gitlab.com\n  HostName gitlab.com\n  User git\n  IdentityFile /home/ubuntu/.ssh/ssh_git'
appendCommand = 'echo "' + CFG + '" >> /home/ubuntu/.ssh/config'

print 'Finished configuring keys ... '
os.system('cat /home/ubuntu/.ssh/ssh_git.pub')
print '^ Copy the key above in your GitLab settings to authorise your username'