export ZDOTDIR=$HOME/.config/zsh \
	EDITOR=nvim \
	GIT_EDITOR=$EDITOR \
	PATH=$PATH:$HOME/.local/bin \
	XINITRC=$HOME/.config/X11/xinitrc \
	XAUTHORITY=$HOME/.config/X11/Xauthority \
	LESSHISTFILE=- \
	TERMINAL=st \
	GNUPGHOME="$HOME"/.config/gnupg

[ "$(tty)" = "/dev/tty1" ] && startx "$HOME/.config/X11/xinitrc" &
