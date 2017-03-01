import os
import getpass
import gitlab

username = raw_input('Enter your username: ')
password = getpass.getpass()

print ('Generating GitLab authentication key ...')
#keygenCommand = 'ssh-keygen -t rsa -b 4096 -C ' + username + ' -P "" -f "C:\\Users\\C102277\\Desktop\\ssh_git"'
keygenCommand = 'ssh-keygen -t rsa -b 4096  -P "" -f "C:\\Users\\C102277\\Desktop\\ssh_git"'
os.system(keygenCommand)

print ('Authorising key for use with GitLab ...')

CFG='\nHost gitlab.com\n  HostName gitlab.com\n  User git\n  IdentityFile C:\\Users\\C102277\\Desktop\\ssh_git'
f = open("C:\Program Files\Git\.ssh\config",'w')
f.write(CFG)

print ('Finished configuring keys ...')
os.system('type "C:\\Users\\C102277\\Desktop\\ssh_git"')
print ('^ Copy the key above in your GitLab settings to authorise your username')

*********************************************gitlab**************************************
#import gitlab look top
#creating an gitlab instance from the config file(should have the details host,username etc) 
gl = gitlab.Gitlab.from_config(config_files=['C:\Program Files\Git\.ssh\config'])
#authentication
gl.auth()

#getting the current user with the below function 
current_user = gl.user

#creating the ssh key for the current user into the  gitlab