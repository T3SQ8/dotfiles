export ZDOTDIR=$HOME/.config/zsh
export GIT_EDITOR=nvim
export PATH=$PATH:$HOME/.local/bin
export XINITRC=$HOME/.config/X11/xinitrc
export XAUTHORITY=$HOME/.config/X11/Xauthority
export LESSHISTFILE=-
export EDITOR=nvim

if [[ "$(tty)" = "/dev/tty1" ]]; then
	startx "$HOME/.config/X11/xinitrc" &
fi
