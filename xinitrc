sxhkd -m -1 &
xset r rate 300 50
xsetroot -cursor_name left_ptr
setxkbmap se
setxkbmap -option caps:escape
xrdb $HOME/.config/X11/Xresources
amixer set Master 0%
lemonpanel &
exec bspwm
