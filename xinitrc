sxhkd &
xsetroot -cursor_name left_ptr
feh --bg-fill --no-fehbg $(ls $HOME/.local/share/wallpaper/*.jpg | shuf -n 1)
setxkbmap se
exec bspwm
