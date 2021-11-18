numlockx &
setxkbmap -option caps:escape &

xrandr --output DVI-D-0 --auto --right-of HDMI-0 &

exec /bin/startdwm
