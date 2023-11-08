# Sinope Thermostat jamer007
## Overview

#### Here the link to my Edge drivers Channel

https://bestow-regional.api.smartthings.com/invite/Pw2DkDvx39M3

This SmartThings Edge drivers were created by me with a lot of inspiration/code from https://github.com/toddaustin07/edgeWeather and https://github.com/Mariano-Github/Edge-Drivers-Beta/tree/main/zigbee-thermostat-stock-mc,  
without them I would have not created those drivers, many thanks.

provides weather data from select weather data sources:
* US Government
* Canadian Weather

This driver requires no SmartApp, however it does require either TAustin **Edge Bridge Server** or a standard **Proxy server**[^1] running on a computer on your network.  This provides the linkage for the Edge driver to reach internet endpoints which otherwise are not available to Edge drivers.

[^1]: Due to a restriction in the current Edge platform implementation, reaching **HTTPS**-based addresses from Edge drivers is not supported using a standard proxy server.  Therefore, if the weather data source is only available via https and not http, then my Edge Bridge Server *must* be used.

The [Edge Bridge Server](https://github.com/toddaustin07/edgebridge) is a simple program you can download and run on any Windows, Linux, or Mac computer.  It requires no complicated setup. Just run it on an always-on computer with internet access and that's it.  An additional benefit to having this running on your network is that it enables expanded options for Edge drivers (like this one!), as well as easy integration with local apps and devices.  See the [Github readme](https://github.com/toddaustin07/edgebridge/blob/main/README.md)  for more details.


### Weather data sources
Currently, the edgeWeather driver provides 2 options for weather data, however it has been designed to be able to easily add more sources.  Please request them in the SmartThings community or in the Issues tab here in Github.  Provide working URLs for current data and forecast that I can use to test;

## Driver Pre-requisites
* SmartThings hub that supports Edge
* SmartThings ID
* Weather source account, if applicable
* An always-on computer on your local network with internet access
* Edge Bridge Server or standard Proxy server[^1]

  Download and run the Edge Bridge Server that meets your needs:

    * [Windows computer](https://github.com/toddaustin07/edgebridge/blob/main/edgebridge.exe)

      Open a command prompt window, navigate to the folder you downloaded the file to, and type 'edgebridge' and press enter.

    * [Linux or Mac (Python 3.x required)](https://github.com/toddaustin07/edgebridge/blob/main/edgebridge.py)

      Open a terminal window, navigate to the directory you downloaded the file to, and type 'python3 edgebridge.py' and press enter.

    * [Raspberry Pi](https://github.com/toddaustin07/edgebridge/blob/main/edgebridge4pi)

      Open a terminal window, navigate to the directory you downloaded the file to, and type 'chmod +x edgebridge4pi' and press enter (this makes the downloaded file executable).  Then to run it, type  './edgebridge4pi' and press enter.

  Alternatively, install a standard Proxy server such as [Privoxy](https://www.howtogeek.com/683971/how-to-use-a-raspberry-pi-as-a-proxy-server-with-privoxy/).

## Features

* Select weather data source
* Separate weather data URLs for current weather conditions
* Automatically refresh on a given interval

#### Current Conditions
* Temperature

## Installation & Configuration
[WIP] The driver is currently available on my [test channel](https://bestow-regional.api.smartthings.com/invite/Q1jP7BqnNNlL).  Enroll your hub and select **Edge Weather V1** from the list of drivers available to install.
When the driver is available on your hub, initiate an *Add device / Scan for nearby devices* from the SmartThings mobile app.  A new device will be created and found in your *No room assigned* or hub device room.  Open the device to the device *Settings* screen (three vertical dot menu in upper right of Controls screen).

### Settings
#### Keypad Lock
For locking or not the thermostat button

#### Backlight setting
For enable or not the screen backlight

#### Time Format
24h or 12h AM/PM format

#### Weather Source
Choose US Gov or Canadian Weather
#### Current Weather URL
The complete URL to retrieve the current weather conditions.

* Must be in the form: http(s)://<...>
* Must include any required account tokens or parameters
##### Examples
* http://api.weather.gov/stations/KBAZ/observations/latest for US Gov
* http://192.168.1.x:5000/<latitude\>,<longitude\> for Canadian Weather jamer007

#### Proxy Server Address
LAN address of either a standard Proxy server or the Edge Bridge Server[^1].
* Must be in the form: http://<IP address\>:<port number\>
* HTTPS is not currently supported
##### Example
* http://192.168.1.150:8088

#### Proxy Type
Choose either 'Standard Proxy Server'[^1] or 'Edge Bridge Server'

#### Periodic Refresh
Use this setting to enable or disable automatic refresh feature

#### Refresh Rate
Provide the number of minutes between refreshes (1-1,440)

#### Secondary Display
Choose what to display on the secondary thermostat screen, Outdoor temperature or Set temperature

### Usage
#### Controls screen

Values can be refreshed at any time by using the 'swipe-down' gesture.

After making any Settings changes, be sure to do a swipe-down gesture on the Controls screen to refresh the values.

Use the Periodic Refresh option in device Settings to automatically update.
