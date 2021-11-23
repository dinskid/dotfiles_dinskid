#!/bin/bash

setxkbmap -option altwin:swap_lalt_lwin
setxkbmap -option caps:swapescape

xinput set-prop "GDX1301:00 27C6:01F0 Touchpad" "libinput Natural Scrolling Enabled" 1
xinput set-prop "GDX1301:00 27C6:01F0 Touchpad" "libinput Tapping Enabled" 1

libinput-gestures-setup start
