[ -e ~/.zshrc-local ] && source ~/.zshrc-local

# http://github.com/robbyrussell/oh-my-zsh
# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Download and install oh-my-zsh if we haven't already
[ -e $HOME/.oh-my-zsh ] || wget --no-check-certificate http://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="robbyrussell"
#export ZSH_THEME="clean"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# no usernames when completing `cd` please
# http://github.com/robbyrussell/oh-my-zsh/issues/issue/34#issue/34/comment/186920
# (if this fails, maybe http://github.com/robbyrussell/oh-my-zsh/issues/#issue/80 )
unset config_file

# Customize to your needs...
# end http://github.com/robbyrussell/oh-my-zsh

alias grep="grep --color"
alias ls='ls --color=auto'
alias vi='vim'
alias vim='vim -X'
alias ssh='ssh -2'
export LESS="-iFRX"
export PATH=$HOME/bin:$PATH
# .dircolors; brighter ls directory colors
export LS_COLORS="di=01;35"

# allows ^ and ~: http://zsh.dotsrc.org/FAQ/zshfaq02.html
setopt extended_glob

# Start screen automatically
export SHELL=zsh
if [ "$TERM" != "screen" ]; then
    exec screen -RR
fi
