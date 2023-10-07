#!/bin/bash

# see volume_adjust and sxhkdrc
trap 'update on changes' 10

volume() {
    echo "Vol: $(awk -F"[][]" '/Left:/ { print $2 }' <(amixer sget Master))"
}

clock() {
    echo "$(LANG=fr_CA.utf8 date +'%a, %m/%d/%Y %H:%M')"
}

free_space() {
    echo "Avail: $(df -h | awk 'NR==4{print $4}')"
}

battery() {
    echo "BAT: $(cat /sys/class/power_supply/BAT0/capacity)%"
}

dpy_brightness() {
    current=$(cat /sys/class/backlight/intel_backlight/brightness)
    max=$(cat /sys/class/backlight/intel_backlight/max_brightness)
    percent=$(python -c "print(int((${current} / ${max}) * 100))")

    echo "DPY: ${percent}%"
}

while :; do
    xsetroot -name "$(free_space) | $(volume) | $(clock)"
    sleep 60s &
    wait $!
done
