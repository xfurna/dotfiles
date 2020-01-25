#!/bin/bash

max=1
cur=$(xrandr --verbose | grep "Brightness: " | cut -f2- -d' ')

case "$1"
in
+) new=$(echo "$cur + 0.10" | bc);;
-) new=$(echo "$cur - 0.10" | bc);;
esac

#if [ "$new" -ge 0 -a "$new" -le 1 ]; then echo "$new";
#fi
xrandr --output eDP-1-1 --brightness "$new"
