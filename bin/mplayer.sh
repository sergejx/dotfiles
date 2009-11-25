#!/bin/sh
# Stop screensaver while mplayer is running
gnome-screensaver-command --inhibit &
/usr/bin/mplayer $@
kill $!
