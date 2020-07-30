autoload -U colors compinit edit-command-line

HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$HOME/.cache/zsh/histfile"

[ ! -d "${HISTFILE%/*}" ] && mkdir -p "${HISTFILE%/*}"
[ ! -f "$HISTFILE" ] && touch "$HISTFILE"
 
# Turn on color and set the prompt
colors
PS1="[%B%{$fg[blue]%}%~%{$reset_color%}]$ "

# Keyboard shortcuts
bindkey -e
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Open command in editor
zle -N edit-command-line
bindkey '^o' edit-command-line

# Allow leaving with running jobs
setopt NO_HUP autocd 

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

# Command-line completion
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files.
