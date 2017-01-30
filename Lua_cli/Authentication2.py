// authorization_code from authorization API.

def retrieve_authorization_code():
  authorization_code_req = {
    "response_type": "code",
    "client_id": client_id,
    "redirect_uri": redirect_uri,
    "scope": (r"https://www.googleapis.com/auth/userinfo.profile" +
              r" https://www.googleapis.com/auth/userinfo.email" +
              r" https://www.googleapis.com/auth/calendar")
    }
  r = requests.get(base_url + "auth?%s" % urlencode(authorization_code_req),
                   allow_redirects=False)
  print "URL"
  url = r.headers.get('location')
  Popen(["open", url])
  authorization_code = raw_input("\nAuthorization Code >>> ")
  return authorization_code