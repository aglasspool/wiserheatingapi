from bottle import route, run, template, request, static_file

from wiserHeatingAPI import wiserHub

from datetime import datetime

import requests
import json
import logging

# Get Wiser Parameters from keyfile
with open("wiserkeys.params", "r") as f:
    data = f.read().split("\n")
wiserkey = ""
wiserip = ""

# Get wiserkey/hubIp from wiserkeys.params file
# This file is not source controlled as it contains the testers secret etc

for lines in data:
    line = lines.split("=")
    if line[0] == "wiserkey":
        wiserkey = line[1]
    if line[0] == "wiserhubip":
        wiserip = line[1]

print(" Wiser Hub IP= {} , WiserKey= {}".format(wiserip, wiserkey))


# Serve static (css and image) files from the /static folder
@route('/static/<filepath:path>')
def server_static(filepath):
    return static_file(filepath, root='static')

@route('/')
def index():
    city = "London"
    api_key = "34b68bf9f7b70bfa195f3b34c58573c1"
    url = f"https://api.openweathermap.org/data/2.5/weather?q={city}&appid={api_key}&units=metric"
    data = requests.get(url).json()
    current_temperature = data['main'].get('temp')

    wh = wiserHub.wiserHub(wiserip, wiserkey)
    
    room1Temp = wh.getRoom(1).get("CalculatedTemperature") / 10
    room2Temp = wh.getRoom(2).get("CalculatedTemperature") / 10
    room3Temp = wh.getRoom(3).get("CalculatedTemperature") / 10
    

    boost  = request.query.boost or 'none'
    match boost:
        case 'none':
            return template("boost", room1Temp=room1Temp, room2Temp=room2Temp, room3Temp=room3Temp, current_temperature=current_temperature)
        case 'thermostat':
            ip = request.get('REMOTE_ADDR')
            wh.setRoomMode(1,"boost", boost_temp=((room1Temp) + 2), boost_temp_time=30)
            now = datetime.now()
            start = now.strftime("%d/%m/%Y at %H:%M")
            return template("boosted", ip=ip, start=start, current_temperature=current_temperature)
        case 'bbedroom':
            ip = request.get('REMOTE_ADDR')
            wh.setRoomMode(2,"boost", boost_temp=((room2Temp) + 2), boost_temp_time=30)
            now = datetime.now()
            start = now.strftime("%d/%m/%Y at %H:%M")
            return template("boosted", ip=ip, start=start, current_temperature=current_temperature)
        case 'bkitchen':
            ip = request.get('REMOTE_ADDR')
            wh.setRoomMode(3,"boost", boost_temp=((room3Temp) + 2), boost_temp_time=30)
            now = datetime.now()
            start = now.strftime("%d/%m/%Y at %H:%M")
            return template("boosted", ip=ip, start=start, current_temperature=current_temperature)
    

if __name__ == '__main__':
    run(host='192.168.1.2', port=80)
