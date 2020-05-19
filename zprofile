export ZDOTDIR=$HOME/.config/zsh
export EDITOR=nvim
export GIT_EDITOR=$EDITOR
export PATH=$PATH:$HOME/.local/bin
export XINITRC=$HOME/.config/X11/xinitrc
export XAUTHORITY=$HOME/.config/X11/Xauthority
export LESSHISTFILE=-
export TERMINAL=st

if [[ "$(tty)" = "/dev/tty1" ]]; then
	startx "$HOME/.config/X11/xinitrc" &
fi
