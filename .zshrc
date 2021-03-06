export LANG=ja_JP.UTF-8
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# path_helper問題を回避するため.zshenv -> .zshrcに移動
export PATH=$HOME/bin:$HOME/Library/Android/sdk/platform-tools:/usr/local/opt/openssl/bin:$HOME/.nodebrew/current/bin:$HOME/.local/bin:$PATH
export PATH=$PATH:`npm bin -g`
export PATH=$HOME/.rbenv/bin:$PATH
if which rbenv > /dev/null ; then eval "$(rbenv init -)"; fi
export PATH=$HOME/.gem/bin:$PATH
export PATH=$HOME/go/bin:$PATH

export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket nvim
export NVIM_PYTHON_LOG_FILE=/tmp/log
export NVIM_PYTHON_LOG_LEVEL=DEBUG

bindkey -e
bindkey -r '^T'

# ctrl-sとctrl-qをsttyに奪われないようにする
stty stop undef
stty start undef

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

fpath=($fpath /usr/local/Cellar/zsh/5.7.1/share/zsh/functions)

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

#=========
# history
#=========

setopt hist_ignore_all_dups
setopt hist_no_store

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
alias noti='terminal-notifier -message "Finished."'
alias pkill="ps aux | fzf | awk '{print \$2}' | xargs kill"

# ZPlug plugins
source ~/.zplug/init.zsh

zplug "b4b4r07/emoji-cli", if:"which jq"
zplug "arks22/tmuximum", as:command
if ! zplug check; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi
zplug load

alias ghci='stack ghci'
