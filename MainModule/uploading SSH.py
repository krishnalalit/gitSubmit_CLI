#import gitlab look top
#creating an gitlab instance from the config file(should have the details host,username etc) 
gl = gitlab.Gitlab('http://gitlab.com', email=username, password=password)
#authentication
gl.auth()

#getting the current user with the below function 
current_user = gl.user

#creating the ssh key for the current user into the  gitlab