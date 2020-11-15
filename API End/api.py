import flask
from flask import request, jsonify

app = flask.Flask(__name__)
app.config["DEBUG"] = True

# False data to test whether API is working
properties = [
    {'id': 0,
     'area': 'Cleveland',
     'damage to property due to storm events in 2019: '25.719M cases',
     'annual violent crime data reported per capita': '6203 cases',
     'annual violent crime data cleared per capita': '961 cases',
     'annual property crime data reported per capita': '17057 cases',
     'annual property crime data cleared per capita': '526 cases',
     },
    {'id': 1,
     'area': 'Columbus',
     'damage to property due to storm events in 2019': '178.8K cases',
     'annual violent crime data reported per capita': '5350 cases',
     'annual violent crime data cleared per capita': '795 cases',
     'annual property crime data reported per capita': '29974 cases',
     'annual property crime data cleared per capita': '1240 cases,
     },
    {'id': 2,
     'area': 'Cincinnati',
     'damage to property due to storm events in 2019': '346.2K cases',
     'annual violent crime data reported per capita': '2824 cases',
     'annual violent crime data cleared per capita': '1229 cases',
     'annual property crime data reported per capita': '13051 cases',
     'annual property crime data cleared per capita': '2362 cases',
     },
    {'id': 3,
     'area': 'Toledo',
     'damage to property due to storm events in 2019': '15.37M cases',
     'annual violent crime data reported per capita': '2784 cases',
     'annual violent crime data cleared per capita': '846 cases',
     'annual property crime data reported per capita': '9470 cases',
     'annual property crime data cleared per capita': '885 cases',
     },
    {'id': 4,
     'area': 'Dayton',
     'damage to property due to storm events in 2019': '61.8K cases',
     'annual violent crime data reported per capita': '1519 cases',
     'annual violent crime data cleared per capita': '558 cases',
     'annual property crime data reported per capita': '5673 cases',
     'annual property crime data cleared per capita': '584 cases',
     },
    {'id': 5,
     'area': 'Ohio',
     'damage to property due to storm events in 2019': '54.682M cases',
     'annual violent crime data per capita': '293.2',
     'annual property crime data per capita': '2055.7',
     },
    {'id': 6,
     'area': 'United States',
     'violent crime data': '379.4',
     'property crime data': '2109.9',
     },
]


@app.route('/', methods=['GET'])
def home():
    return '''<h1>Property Area Statistics</h1>
<p>This API has been created to show the stats of cities in Ohio compared to the United States.</p>'''


@app.route('/api/v1/resources/properties/all', methods=['GET'])
def api_all():
    return jsonify(properties)


@app.route('/api/v1/resources/properties', methods=['GET'])
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
