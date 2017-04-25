#!/usr/bin/env python

import gitlab
import sys
# gitlab connection using username password
#gl = gitlab.Gitlab('https://gitlab.com', email='', password='')

#gitlab connection using token
gl = gitlab.Gitlab('http://csgrad06.nwmissouri.edu', 'z_5Z9VzJNyChUsbc13xM')
gl.auth()
print(sys.argv)
val = sys.argv[1:][0].strip()
k = gl.user_keys.create({'title': 'my_key',
                         'key': open(sys.argv[1]).read()},user_id=1)

print(k)
