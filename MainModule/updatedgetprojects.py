#!/usr/bin/env python

import gitlab
import sys

#gitlab connection using token
gl = gitlab.Gitlab('http://csgrad06.nwmissouri.edu', 'z_5Z9VzJNyChUsbc13xM')

gl.auth()

# list all the projects
projects = gl.projects.list()
for project in projects:
   print(project.path_with_namespace)

# projects list using search query
projects_1 = gl.projects.search('Test')
for project in projects_1:
   print(project.web_url)

query = input('enter any of the above project username/name \n')

project = projects[int(query)];
#print(project.web_url)

file = open("/tmp/repoReturn.txt","w")
file.write(project.web_url)
file.close()
