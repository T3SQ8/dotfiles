# Loading
autoload -U colors compinit edit-command-line
colors
compinit
zle -N edit-command-line
zmodload zsh/complist

# Options
setopt NO_HUP autocd correct auto_pushd nolistambiguous completeinword

# Command-line completion
zstyle ':completion:*' menu select
_comp_options+=(globdots)
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Variables
HISTSIZE=1000
SAVEHIST=10000
HISTFILE="$HOME/.cache/zsh/histfile"
WORDCHARS="${WORDCHARS/\/}"
PS1="[%B%{$fg[blue]%}%~%{$reset_color%}]$ "

# Shortcuts
bindkey -e
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '^o' edit-command-line

# Aliases
alias \
	ls='ls --color=auto' \
	e='$EDITOR' \
	grep='grep --color'

# Git aliases
alias \
	ga='git add' \
	gs='git status' \
	gc='git commit' \
	gp='git add' \
	gd='git diff' \
	gp='git push'

# Create histfile
[ -d "${HISTFILE%/*}" ] || mkdir -p "${HISTFILE%/*}"
[ -f "$HISTFILE" ] || touch "$HISTFILE"

stty -ixon
