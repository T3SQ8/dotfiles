# History in cache directory:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.cache/zsh/histfile
 
autoload -U colors && colors
# PS1="%B%{$fg[green]%}%n@%M%{$reset_color%}:%B%{$fg[blue]%}%~%{$reset_color%}$ "
PS1="[%B%{$fg[blue]%}%~%{$reset_color%}]$ "

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
 
# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist
compinit
_comp_options+=(globdots)               # Include hidden files.
 
# Vim mode
bindkey -e

alias ls='ls --color=auto'
alias e='$EDITOR'


# Open command in a vim buffer
autoload edit-command-line
zle -N edit-command-line
bindkey '^o' edit-command-line

setopt NO_HUP
