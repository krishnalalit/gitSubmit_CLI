import os
import getpass

username = raw_input('Enter your username: ')
password = getpass.getpass()

print 'Generating GitLab authentication key ...'
keygenCommand = 'ssh-keygen -t rsa -b 4096 -C ' + username + ' -P "" -f "C:\Users\Sahil\Desktop\ssh_git"'
os.system(keygenCommand)

print 'Authorising key for use with GitLab ...'

CFG='\nHost gitlab.com\n  HostName gitlab.com\n  User git\n  IdentityFile C:\Users\Sahil\Desktop\ssh_git'
f = open("C:\Program Files\Git\.ssh\config",'w')
f.write(CFG)

print 'Finished configuring keys ...'
os.system('type "C:\Users\Sahil\Desktop\ssh_git"')
print '^ Copy the key above in your GitLab settings to authorise your username'