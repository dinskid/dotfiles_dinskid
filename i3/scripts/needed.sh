#!/bin/bash

setxkbmap -option altwin:swap_lalt_lwin
setxkbmap -option caps:swapescape

xinput set-prop "ELAN1200:00 04F3:30B7 Touchpad" "libinput Natural Scrolling Enabled" 1
xinput set-prop "ELAN1200:00 04F3:30B7 Touchpad" "libinput Tapping Enabled" 1

libinput-gestures-setup start
