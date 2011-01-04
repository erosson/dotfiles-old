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

# http://www.faqs.org/docs/bashman/bashref_102.html
set -o emacs
bindkey -e

# because we don't want this in git
# TODO move this to scruffy's .zshrc-local
export NFS_ACCOUNT_NAME=erosson

#alias emacs="emacs --fullscreen"
alias grep="grep --color"
alias ls='ls --color=auto'
alias vi='vim'
alias vim='vim -X'
alias ssh='ssh -2'
alias today='date +%Y%m%d'
alias today-path='date +%Y/%m/%d'
alias jconsole='/apollo/env/JavaSE6/jdk1.6.0/bin/jconsole'
export LESS="-iFRX"
#export PATH=$HOME/bin:$PATH:$HOME/.cabal/bin:$HOME/.gem/ruby/1.8/bin:/var/lib/gems/1.8/bin
export PATH=/home/evan/bin:$HOME/haxe/bin:/home/evan/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/evan/.cabal/bin:/home/evan/.gem/ruby/1.9.1/bin:/var/lib/gems/1.9.1/bin:$HOME/local/bin/

export MANPATH=$MANPATH:$HOME/shared/man

export WINDOW_MANAGER=xmonad
# Make java-swing work
# http://www.haskell.org/pipermail/xmonad/2007-June/001090.html
export AWT_TOOLKIT=MToolkit

# allows ^ and ~: http://zsh.dotsrc.org/FAQ/zshfaq02.html
setopt extended_glob

# Start screen automatically
export SHELL=zsh
if [ "$TERM" != "screen" ]; then
    exec screen -RR
#    exec screen
#else
#    echo "broke screen startup infinite loop"
fi

#setopt nobeep
xset b off

