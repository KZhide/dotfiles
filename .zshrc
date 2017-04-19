export LANG=ja_JP.UTF-8
bindkey -v

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

# completion
autoload -U compinit; compinit

# colors
autoload -Uz colors; colors
PROMPT="%{${fg[green]}%}[%n@%m]%{${reset_color}%} %# "

# vcs info
autoload -Uz vcs_info

setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT='[%~]${vcs_info_msg_0_}'

setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups

alias vi=nvim
alias ls="ls -G"

#eval "$(docker-machine env dev)"
