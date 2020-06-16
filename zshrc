autoload -U colors compinit edit-command-line

# History in cache directory:
[ -e $HOME/.cache/zsh/histfile ] || mkdir -p $HOME/.cache/zsh/ && touch $HOME/.cache/zsh/histfile

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.cache/zsh/histfile
 
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
alias ls='ls --color=auto'
alias e='$EDITOR'
alias grep='grep --color'

# Command-line completion
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files.
 
