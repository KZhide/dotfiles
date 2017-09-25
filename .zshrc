export LANG=ja_JP.UTF-8
bindkey -e
bindkey -r '^T'

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

# completion
autoload -U compinit; compinit

# colors
autoload -Uz colors; colors
PROMPT="%{${fg[green]}%}[%n]
%{${fg[red]}%}❱%{${fg[yellow]}%}❱%{${fg[green]}%}❱%{${fg[cyan]}%}❱%{${fg[magenta]}%}❱ %{${reset_color}%}"

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

# history search
function select-history() {
  BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
  CURSOR=$#BUFFER
}
zle -N select-history
bindkey '^r' select-history

setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups

alias vi=nvim
alias ls="ls -G"
alias noti='terminal-notifier -message "Finished."'

# ZPlug plugins
source ~/.zplug/init.zsh
zplug "b4b4r07/emoji-cli"
