import asyncio
from flask import Flask

from env_canada import ECWeather

app = Flask(__name__)


@app.route('/')
def get_weather():
    return get_current_weather()


def get_current_weather():
    ec_en = ECWeather(coordinates=(46.139482, -73.661778))
    # ec_fr = ECWeather(station_id='ON/s0000430', language='french')

    asyncio.run(ec_en.update())

    # current conditions
    current = ec_en.conditions

    if current.get('temperature', {}).get('value') is not None:
        return {'temp': current.get('temperature').get('value')}


# daily forecasts
# ec_en.daily_forecasts
#
# # hourly forecasts
# ec_en.hourly_forecasts
#
# # alerts
# ec_en.alerts

# main driver function
if __name__ == '__main__':
    # run() method of Flask class runs the application
    # on the local development server.
    app.run(host='0.0.0.0', port=5000)
