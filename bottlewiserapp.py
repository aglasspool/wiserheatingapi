from bottle import route, run, template, request, static_file

from wiserHeatingAPI import wiserHub

from datetime import datetime

import requests


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

try:
    wh = wiserHub.wiserHub(wiserip, wiserkey)

    print("-------------------------------")
    print("Running tests")
    print("-------------------------------")
    print ("Model # {}".format(wh.getWiserHubName()))
    # Display some states
    # Heating State
    print("Hot water status {} ".format(wh.getHotwaterRelayStatus()))
    # Assumes at least one roomstat
    print("Roomstat humidity {}".format(wh.getRoomStatData(1).get("MeasuredHumidity")))

    print("--------------------------------")
    print("List of Devices")
    print("--------------------------------")

    for device in wh.getDevices():
        print(
            "Device : Id {} Name {} Type {} , SignalStrength {}  ".format(
                device.get("id"),
                device.get("Name"),
                device.get("ProductType"),
                device.get("DisplayedSignalStrength"),
            )
        )


    #  List all Rooms

    findValve = 0
    roomName = None

    print("--------------------------------")
    print("Listing all Rooms")
    print("--------------------------------")
    for scheduleRoomTest in wh.getRooms():
        smartValves = scheduleRoomTest.get("SmartValveIds")
        if smartValves is None:
            print("Room {} has no smartValves")
        else:
            print(
                "Room {}, setpoint={}C, current temp={}C".format(
                    scheduleRoomTest.get("Name"),
                    scheduleRoomTest.get("CurrentSetPoint") / 10,
                    scheduleRoomTest.get("CalculatedTemperature") / 10,
                )
            )

    room1Temp = wh.getRoom(1).get("CalculatedTemperature") / 10
    room2Temp = wh.getRoom(2).get("CalculatedTemperature") / 10
    room3Temp = wh.getRoom(3).get("CalculatedTemperature") / 10


# Other Examples
# Setting HOME Mode , change to AWAY for away mode
#    wh.setHomeAwayMode("HOME")
#    wh.setHomeAwayMode("AWAY",10)
# Set room 4 TRVs to off, which is -200
#    print( wh.getRoom(4).get("Name"))
#    wh.setRoomMode(4,"off")
# Set room 4 TRVs to manual, setting normal scheduled temp
#    wh.setRoomMode(4,"manual")
# Set temperature of room 4 to 13C
#    wh.setRoomTemperature(4,10)
# Set TRV off in room 4 to Off
#    wh.setRoomTemperature(4,-20)

except json.decoder.JSONDecodeError as ex:
    print("JSON Exception")
    

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

    boost  = request.query.boost or 'none'
    match boost:
        case 'none':
            return template("boost", room1Temp=room1Temp, room2Temp=room2Temp, room3Temp=room3Temp, current_temperature=current_temperature)
        case 'thermostat':
            ip = request.get('REMOTE_ADDR')
            wh.setRoomMode(1,"boost", boost_temp=14, boost_temp_time=30)
            now = datetime.now()
            start = now.strftime("%d/%m/%Y at %H:%M")
            return template("boosted", ip=ip, start=start, current_temperature=current_temperature)
        case 'bbedroom':
            ip = request.get('REMOTE_ADDR')
            wh.setRoomMode(3,"boost", boost_temp=((room3Temp) + 2), boost_temp_time=30)
            now = datetime.now()
            start = now.strftime("%d/%m/%Y at %H:%M")
            return template("boosted", ip=ip, start=start, current_temperature=current_temperature)
        case 'bkitchen':
            ip = request.get('REMOTE_ADDR')
            wh.setRoomMode(2,"boost", boost_temp=((room2Temp) + 2), boost_temp_time=30)
            now = datetime.now()
            start = now.strftime("%d/%m/%Y at %H:%M")
            return template("boosted", ip=ip, start=start, current_temperature=current_temperature)
    

if __name__ == '__main__':
    run(host='localhost', port=8080, debug=True)

