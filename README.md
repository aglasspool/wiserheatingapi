ssh root@192.168.1.2

**To stop luci:** 
service uhttpd stop

**To start the app:**
cd into the wiserheating_copy folder and then:

nohup bottlewiserapp.py > nohup_bottlewiser_output.log &

**To kill the bottlewiser app**
use TOP to find the PID and then kill it using the PID or: pkill -f bottlewiserapp.py

**NB**

Apparently this api is now deprecated and we should be using the https://github.com/msp1974/aioWiserHeatAPI api instead..

