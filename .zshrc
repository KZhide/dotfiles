export LANG=ja_JP.UTF-8
bindkey -v

autoload -U compinit; compinit
autoload -Uz colors; colors

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

PROMPT="%{${fg[green]}%}[%n@%m]%{${reset_color}%} %~
%# "

setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups

alias vi=nvim
alias ls="ls -G"

#eval "$(docker-machine env dev)"
