import requests

USERNAME = 'user' # put correct usename here
PASSWORD = 'password' # put correct password here

LOGINURL = 'https://login.example.com/'
DATAURL = 'https://data.example.com/secure_data.html'

session = requests.session()

req_headers = {
    'Content-Type': 'application/x-www-form-urlencoded'
}

formdata = {
    'UserName': USERNAME,
    'Password': PASSWORD,
    'LoginButton' : 'Login'
}

# Authenticate
r = session.post(LOGINURL, data=formdata, headers=req_headers, allow_redirects=False)
print r.headers
print r.status_code
print r.text

# Read data
r2 = session.get(DATAURL)
print "___________DATA____________"
print r2.headers
print r2.status_code
print r2.text
