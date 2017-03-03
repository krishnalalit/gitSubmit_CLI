+import gitlab

+

+# gitlab connection using username password

+#gl = gitlab.Gitlab('https://gitlab.com', email='sushmagsar@gmail.com', password='Bunny$20945')

+

+#gitlab connection using token

+gl = gitlab.Gitlab('https://gitlab.com', '9yRKey51NiMGmKxxbAtk')

+

+gl.auth()

+

+# list all the projects

+projects = gl.projects.list()

+#printing the projects available for the username
+print(projects)

+#asking the user to make a choice from the list
+ProjectID = raw_input('Enter the projectId you wish from the list')

+#getting the project based on projectID
+currentProject = gl.projects.get(ProjectID)

+#getting url of the project
+urlOfProject = currentProject.http_url_to_repo

+#stroing the url into file under programdata 
+file = open("C:\\ProgramData\\Url.txt",'w')
+file.write(urlOfProject)