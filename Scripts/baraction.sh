#!/bin/bash

# see volume_adjust
trap 'update bar on volume change' 10

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

while :; do
    xsetroot -name "$(free_space) | $(volume) | $(battery) | $(clock)"
    sleep 60s &
    wait $!
done
