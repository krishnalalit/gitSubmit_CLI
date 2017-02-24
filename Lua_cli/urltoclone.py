from urllib import *
page = urlopen("https://gitlab.com/")
gitlaburl = page.geturl()
print gitlaburl