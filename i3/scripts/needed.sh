setxkbmap -option altwin:swap_lalt_lwin
setxkbmap -option caps:swapescape

xinput set-prop "GDX1301:00 27C6:01F0 Touchpad" 341 1
xinput set-prop "GDX1301:00 27C6:01F0 Touchpad" 323 1

libinput-gestures-setup start
