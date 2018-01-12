export XDG_CONFIG_HOME=$HOME/dotfiles
case ${OSTYPE} in
  darwin*)
    export JAVA_HOME=$(/usr/libexec/java_home)
    ;;
  linux*)
    ;;
esac
