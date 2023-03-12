#!/bin/bash

# see volume_adjust
trap 'update bar on volume change' 10

volume() {
    echo "Vol: $(awk -F"[][]" '/Left:/ { print $2 }' <(amixer sget Master))"
}

clock() {
    echo "$(LANG=fr_CA.utf8 date +'%A, %B %d, %H:%M')"
}

while :; do
    echo "$(volume) | $(clock) "
    sleep 60s &
    wait $!
done
