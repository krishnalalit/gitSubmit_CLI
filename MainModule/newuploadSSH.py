import gitlab
import sys 
# gitlab connection using username password
#gl = gitlab.Gitlab('https://gitlab.com', email='sushmagsar@gmail.com', password='Bunny$20945')

#gitlab connection using token
gl = gitlab.Gitlab('http://csgrad06.nwmissouri.edu', 'Tpxir43wuUTVyLq_ezZA')

gl.auth()


k = gl.user_keys.create({'title': 'my_key',
                         'key': open('/usr/local/share/ubuntu/.ssh/ssh_git.pub').read()},
                        user_id=1)

print(k)