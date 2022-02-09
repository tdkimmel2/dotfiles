numlockx &
setxkbmap -option caps:swapescape &

#$xrandr to check names of output ports
xrandr --output HDMI-0 --primary --mode 1920x1080 --output DVI-D-0 --mode 1600x900 --right-of HDMI-0 &

exec /bin/startdwm

#(sleep 5 && /home/tkimmel/builds/dwm/dwm-bar/dwm_bar.sh & feh --bg-scale /home/tkimmel/Pictures/ArchLinuxDragonWallpaper.jpg)
