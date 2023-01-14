if [ "$TTY" = "/dev/tty1" ]; then
	startx "$XINITRC" -- -keeptty > ~/.cache/xorg.log 2>&1
fi
