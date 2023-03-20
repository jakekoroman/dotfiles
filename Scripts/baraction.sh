#!/bin/bash

# see volume_adjust
trap 'update bar on volume change' 10

volume() {
    echo "Vol: $(awk -F"[][]" '/Left:/ { print $2 }' <(amixer sget Master))"
}

clock() {
    echo "$(LANG=fr_CA.utf8 date +'%A, %B %d, %H:%M')"
}

free_space() {
    echo "Avail: $(df -h | awk 'NR==2{print $4}')"
}

while :; do
    echo "$(free_space) | $(volume) | $(clock)"
    sleep 60s &
    wait $!
done
