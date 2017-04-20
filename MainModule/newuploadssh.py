#!/usr/bin/env python

import gitlab
import sys 
# gitlab connection using username password
#gl = gitlab.Gitlab('https://gitlab.com', email='sushmagsar@gmail.com', password='Bunny$20945')

#gitlab connection using token
gl = gitlab.Gitlab('http://csgrad06.nwmissouri.edu', 'Tpxir43wuUTVyLq_ezZA')
gl.auth()
val = sys.argv[1:][0].strip()
k = gl.user_keys.create({'title': 'my_key',
<<<<<<< HEAD
                         'key': open(sys.argv[1]).read()},
=======
<<<<<<< HEAD
                         'key': val},
=======
<<<<<<< HEAD
                         'key': open('~/Desktop/GitLabRepo/gitLabCLIKeys.pub').read()},
=======
                         'key': open(sys.argv[1]).read()},
>>>>>>> master
>>>>>>> master
>>>>>>> master
                        user_id=1)

print(k)
