import requests
from urllib import *
page = urlopen("https://gitlab.com/")
gitlaburl = page.geturl()
data1 = {
	'username' : 'sushma1234',
	'password' : 'Bunny$20945'

}

import sys
with requests.Session() as c:
	c.post(gitlaburl, data = data1)
	r = c.get('https://gitlab.com')
	print r.content
	