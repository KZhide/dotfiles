export LANG=ja_JP.UTF-8
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
bindkey -e
bindkey -r '^T'

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

# completion
autoload -U compinit; compinit
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

# colors
autoload -Uz colors; colors
PROMPT="%{${fg[cyan]}%}[%n]
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
case ${OSTYPE} in
  darwin*)
    alias ls="ls -G";;
  linux*)
    alias ls="ls --color";;
esac

# ZPlug plugins
source ~/.zplug/init.zsh
zplug "b4b4r07/emoji-cli"
