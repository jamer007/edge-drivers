import asyncio
from flask import Flask

from env_canada import ECWeather

app = Flask(__name__)


@app.route('/<coord>')
def get_weather(coord=None):
    if coord:
        coord = coord.split(',')
        if len(coord) < 2:
            print('Coordinate must be geodesic format, ex: 45.512333,-73.587011')
            return {}
        return get_current_weather(float(coord[0]), float(coord[1]))
    else:
        print('Please provide coordinate')
        return {}


def get_current_weather(lat: float, lon: float) -> dict:
    ec_en = ECWeather(coordinates=(lat, lon))
    asyncio.run(ec_en.update())
    current = ec_en.conditions

    if current.get('temperature', {}).get('value') is not None:
        return {'temp': current.get('temperature').get('value')}


# main driver function
if __name__ == '__main__':
    # run() method of Flask class runs the application
    # on the local development server.
    app.run(host='0.0.0.0', port=5000)
