export XDG_CONFIG_HOME=$HOME/.config
alias vi=nvim
alias ls="ls -G"

export PATH=$HOME/.nodebrew/current/bin:$HOME/.local/bin:$PATH
eval "$(docker-machine env dev)"
