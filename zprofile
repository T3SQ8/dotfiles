export ZDOTDIR=$HOME/.config/zsh \
	EDITOR=nvim \
	PATH=$PATH:$HOME/.local/bin \
	XINITRC=$HOME/.config/X11/xinitrc \
	XAUTHORITY=$HOME/.config/X11/Xauthority \
	LESSHISTFILE=- \
	TERMINAL=st \
	GNUPGHOME="$HOME"/.config/gnupg

export GIT_EDITOR=$EDITOR

[ "$(tty)" = "/dev/tty1" ] && startx "$HOME/.config/X11/xinitrc" &
