numlockx &
setxkbmap -option caps:swapescape &

#$xrandr to check names of output ports
#xrandr --output HDMI-0 --primary --mode 1920x1080 --output DVI-D-0 --mode 1600x900 --right-of HDMI-0 &
xrandr --output DP-4 --mode 3440x1440 --primary --output HDMI-0 --mode 1920x1080 --right-of DP-4 &

systemctl --user import-environment DISPLAY &&
systemctl --user start dunst &

feh --bg-scale /home/tkimmel/Pictures/Wallpapers/ArchLinuxDragonWallpaper.jpg &

exec /bin/startdwm
