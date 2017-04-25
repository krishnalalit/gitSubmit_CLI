#!/usr/bin/env python

import gitlab
import sys
# gitlab connection using username password
#gl = gitlab.Gitlab('https://gitlab.com', email='sushmagsar@gmail.com', password='Bunny$20945')

#gitlab connection using token
gl = gitlab.Gitlab('http://csgrad06.nwmissouri.edu', '6tag-c1zDkAq3x1K9rnr')
gl.auth()
print(sys.argv)
val = sys.argv[1:][0].strip()
k = gl.user_keys.create({'title': 'my_key',
                         'key': open(sys.argv[1]).read()},user_id=1)

print(k)
