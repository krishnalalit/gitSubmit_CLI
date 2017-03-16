#working code to upload SSH key

import gitlab look top
#creating an gitlab instance from the config file(should have the details host,username etc) 
gl = gitlab.Gitlab('http://gitlab.com', email=username, password=password)
#authentication
gl.auth()

#getting the current user with the below function 
current_user = gl.user

#creating the ssh key for the current user into the  gitlab

k = gl.user_keys.create({'title': 'my_key',
'key': open('/home/ubuntu/.ssh/ssh_git').read()},
user_id=current_user.user_id)

******************************************************************************************************************************************

#This is continuation of SUSHMA'S script.


projects = gl.projects.list()

#printing the projects available for the username
print(projects)

#asking the user to make a choice from the list
ProjectID = raw_input('Enter the projectId you wish from the list')

#getting the project based on projectID
currentProject = gl.projects.get(ProjectID)

#getting url of the project
urlOfProject = currentProject.http_url_to_repo

#stroing the url into file under programdata 
file = open("C:\\ProgramData\\Url.txt",'w')
file.write(urlOfProject)