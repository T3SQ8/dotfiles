# Loading
autoload -U compinit edit-command-line
compinit
zle -N edit-command-line
zmodload zsh/complist

# Options
setopt nohup autocd autopushd nolistambiguous nocheckrunningjobs
SAVEHIST=10000
HISTSIZE=1000

# Command-line completion
zstyle ':completion:*' menu select
_comp_options+=(globdots)
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' hosts off

# Shortcuts
bindkey -v
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^L" clear-screen
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward
bindkey "^U" kill-whole-line
bindkey "^W" backward-kill-word
bindkey "^D" delete-char
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '^o' edit-command-line
stty -ixon

# Aliases
alias \
	e='$EDITOR' \
	o='xdg-open' \
	ls='ls --color=auto' \
	cp='cp -v' \
	mv='mv -v' \
	rm='rm -v' \
	du='du -h --apparent-size' \
	grep='grep --color' \
	wget='wget --hsts-file=' \
	gzip='gzip -v' \
	xz='xz -v' \
	rsync='rsync -rP' \
	wownerod='wownerod --data-dir ~/.local/share/wownerod' \
	monerod='monerod --data-dir ~/.local/share/bitmonero'

# Git aliases
alias \
	gs='git status' \
	ga='git add' \
	gc='git commit' \
	gd='git diff' \
	gl='git log --oneline' \
	gp='git push' \
