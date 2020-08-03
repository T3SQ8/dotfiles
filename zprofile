export ZDOTDIR="$HOME/.config/zsh" \
	EDITOR="nvim" \
	PATH="$PATH:$HOME/.local/bin" \
	XINITRC="$HOME/.config/X11/xinitrc" \
	XAUTHORITY="$HOME/.config/X11/Xauthority" \
	LESSHISTFILE="$HOME/.cache/lesshst" \
	TERMINAL="st" \
	GNUPGHOME="$HOME/.config/gnupg" \
	PYTHONSTARTUP="$HOME/.config/python/startup.py" \
	PANEL_FIFO=/tmp/panel-fifo

export GIT_EDITOR="$EDITOR"

[ "$(tty)" = "/dev/tty1" ] && startx "$XINITRC" &
