import flask
from flask import request, jsonify

app = flask.Flask(__name__)
app.config["DEBUG"] = True

# False data to test whether API is working
properties = [
    {'id': 0,
     'area': 'Cleveland',
     'flood likelihood': '75%',
     'crime data': '50% above Ohio',
     'disasters': '25% likely'},
    {'id': 1,
     'area': 'Columbus',
     'flood likelihood': '50%',
     'crime data': '75% above Ohio',
     'disasters': '25% likely'},
    {'id': 2,
     'area': 'Cincinnati',
     'flood likelihood': '10%',
     'crime data': '60% above Ohio',
     'disasters': '30% likely'},
    {'id': 3,
     'area': 'Toledo',
     'flood likelihood': '60%',
     'crime data': '75% above Ohio',
     'disasters': '40% likely'},
    {'id': 4,
     'area': 'Dayton',
     'flood likelihood': '10%',
     'crime data': '30% above Ohio',
     'disasters': '20% likely'},
    {'id': 5,
     'area': 'Ohio',
     'flood likelihood': '50%',
     'crime data': '50% above the nation',
     'disasters': '10% likely'},
]


@app.route('/', methods=['GET'])
def home():
    return '''<h1>Distant Reading Archive</h1>
<p>A prototype API for distant reading of science fiction novels.</p>'''


@app.route('/api/v1/resources/books/all', methods=['GET'])
def api_all():
    return jsonify(properties)


@app.route('/api/v1/resources/books', methods=['GET'])
def api_id():
    # Check if an ID was provided as part of the URL.
    # If ID is provided, assign it to a variable.
    # If no ID is provided, display an error in the browser.
    if 'id' in request.args:
        id = int(request.args['id'])
    else:
        return "Error: No id field provided. Please specify an id."

    # Create an empty list for our results
    results = []

    # Loop through the data and match results that fit the requested ID.
    # IDs are unique, but other fields might return many results
    for property1 in properties:
        if property1['id'] == id:
            results.append(property1)

    # Use the jsonify function from Flask to convert our list of
    # Python dictionaries to the JSON format.
    return jsonify(results)

app.run()
