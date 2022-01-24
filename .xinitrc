numlockx &
setxkbmap -option caps:escape &

#$xrandr to check names of output ports
xrandr --output DVI-D-0 --auto --right-of HDMI-0 &

exec /bin/startdwm

#(sleep 5 && /home/tkimmel/builds/dwm/dwm-bar/dwm_bar.sh & feh --bg-scale /home/tkimmel/Pictures/ArchLinuxDragonWallpaper.jpg)
