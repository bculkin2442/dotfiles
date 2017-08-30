#!/bin/bash

xsetroot -bitmap ~/wvguess.XBM -fg gold2 -bg blue

# Start system dock and system tray
xdockserver &
wmsystray &

# Start dock apps
xdclock -c12 &

# Start notification server
dunst &
# Start up a terminal
st &

exec goomwwm
