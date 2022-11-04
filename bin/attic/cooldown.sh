#!/bin/sh
# Stop fan in HP2510p after resuming from sleep
/bin/echo "0" >/sys/class/thermal/cooling_device0/cur_state
/bin/echo "0" >/sys/class/thermal/cooling_device1/cur_state
/bin/echo "0" >/sys/class/thermal/cooling_device2/cur_state
/bin/echo "0" >/sys/class/thermal/cooling_device3/cur_state
/bin/echo "0" >/sys/class/thermal/cooling_device4/cur_state
/bin/echo "0" >/sys/class/thermal/cooling_device5/cur_state
/bin/echo "0" >/sys/class/thermal/cooling_device6/cur_state
exit 0
