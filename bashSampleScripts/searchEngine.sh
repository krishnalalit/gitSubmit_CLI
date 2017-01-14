#!/bin/sh

echo "Content-type: text/html"
echo

echo '<html> <head> <title> Search results </title> </head> <body>'

argument=`echo "$QUERY_STRING" | sed "s|q=||"`

cd /users/homes/me/public_html

echo '<pre>'
grep -i "$argument" *html */*html		 |    sed -e 's|<|\&lt;|g'   |   sed -e 's|>|\&gt;|g'
echo '</pre>'
