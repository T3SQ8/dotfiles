export \
	BROWSER="firefox" \
	EDITOR="nvim" \
	TERMINAL="st" \
	PANEL_FIFO="/tmp/panel-fifo" \
	PATH="$PATH:$HOME/.local/bin"

# HOME cleanup
export \
	GNUPGHOME="$HOME/.config/gnupg" \
	LESSHISTFILE="$HOME/.cache/lesshst" \
	PYTHONSTARTUP="$HOME/.config/python/startup.py" \
	TEXMFCONFIG="$HOME/.config/texlive/texmf-config" \
	TEXMFHOME="$HOME/.config/texmf" \
	TEXMFVAR="$HOME/.cache/texlive/texmf-var" \
	XAUTHORITY="$HOME/.config/X11/Xauthority" \
	XINITRC="$HOME/.config/X11/xinitrc"

# ZSH
export \
	ZDOTDIR="$HOME/.config/zsh" \
	HISTSIZE=1000 \
	SAVEHIST=10000 \
	HISTFILE="$HOME/.cache/zshhist" \
	PS1="[%B%F{blue}%~%f%b]$ " \
	WORDCHARS="_"
