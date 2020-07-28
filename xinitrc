xset r rate 300 50
xsetroot -cursor_name left_ptr
setxkbmap se
setxkbmap -option caps:escape
amixer set Master 0%
xrdb "$HOME/.config/X11/Xresources"

sxhkd -m -1 &
dunst &
battlow &
exec bspwm
