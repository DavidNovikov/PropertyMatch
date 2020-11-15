import urllib.request
import sys

idNum = sys.argv[1]
#load the requested set of data based on the idNum and save it into a string
url = 'http://127.0.0.1:5000/api/v1/resources/properties?id=' + str(idNum)
with urllib.request.urlopen(url) as response:
    html = response.read()
rawData = html.decode()
#write the string to a file to be accessed later by the dart script
with open('data.txt', 'w') as f:
    f.write(rawData)
