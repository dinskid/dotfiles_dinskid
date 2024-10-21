#!/bin/sh

last=110
duration=60

min=20

while true; do

    notified=0
    percent=$(acpi | awk '{ split($0, a, " "); print a[4]; }' | sed 's/[,%]//g')
    if [ $percent -le $min ]; then
	notify-send -u critical -t 1000000 "Battery status" "Battery very low: $percent%"
	duration=10
    else
	del=$((percent - last))
	if [[ $del -lt 0 ]]; then
	    del=$((last - percent))
	fi

	if [[ $del -ge 10 ]]; then
	    notify-send -t 3000 "Battery status" "`acpi`"
	fi
	last=$percent
	echo $last
    fi
    sleep $duration
done

