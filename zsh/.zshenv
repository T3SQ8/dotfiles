export \
	BROWSER="firefox" \
	EDITOR="nvim" \
	TERMINAL="st" \
	GTK_THEME="Arc-Dark-solid" \
	PATH="$PATH:$HOME/.local/bin"

export \
	XDG_DATA_HOME="$HOME/.local/share" \
	XDG_CONFIG_HOME="$HOME/.config" \
	XDG_STATE_HOME="$HOME/.local/state" \
	XDG_CACHE_HOME="$HOME/.cache"

# HOME cleanup
export \
	GNUPGHOME="$XDG_CONFIG_HOME/gnupg" \
	LESSHISTFILE="$XDG_CACHE_HOME/lesshst" \
	PYTHONSTARTUP="$XDG_CONFIG_HOME/python/startup.py" \
	TEXMFCONFIG="$XDG_CONFIG_HOME/texlive/texmf-config" \
	TEXMFHOME="$XDG_CONFIG_HOME/texmf" \
	TEXMFVAR="$XDG_CACHE_HOME/texlive/texmf-var" \
	XAUTHORITY="$XDG_CONFIG_HOME/X11/Xauthority" \
	XINITRC="$XDG_CONFIG_HOME/X11/xinitrc" \
	ZDOTDIR="$XDG_CONFIG_HOME/zsh" \
	HISTFILE="$XDG_CACHE_HOME/zshhist"

# ZSH
export \
	PS1="[%B%F{blue}%~%f%b]$ " \
	WORDCHARS="_"
