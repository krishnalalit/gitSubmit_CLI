import gitlab

# gitlab connection using username password
#gl = gitlab.Gitlab('https://gitlab.com', email='sushmagsar@gmail.com', password='Bunny$20945')

#gitlab connection using token
gl = gitlab.Gitlab('https://gitlab.com', '9yRKey51NiMGmKxxbAtk')

gl.auth()