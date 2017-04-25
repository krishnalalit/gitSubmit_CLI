#gl = gitlab.Gitlab('https://gitlab.com', email='sushmagsar@gmail.com', password='Bunny$20945')

#gitlab connection using token
gl = gitlab.Gitlab('https://gitlab.com', '9yRKey51NiMGmKxxbAtk')

import sys
with requests.Session() as c:
        c.post(gitlaburl, data = data1)
        import sys
with requests.Session() as c:
        c.post(gitlaburl, data = data1)
        r = c.get('https://gitlab.com/sushma1234')
import os
subject = raw_input('Enter the name of the subject: ')
if os.path.isdir('./' + subject):
  os.system('cd ' + subject)
else:
  os.system('git clone git@gitlab.com:sushma1234/' + subject )
  os.system('cd ' + subject)
print '#####'
print 'Current repository (subject): ' + subject
print os.system('git branch | grep "*"')
r = c.get('https://gitlab.com/sushma1234')