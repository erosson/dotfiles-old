export CLOJURE_EXT=~/.clojure
alias clj=clj-env-dir

# use a terminal please
#alias emacs="emacs -nw"
# ok, no terminal (ctrl-a), but fullscreen please
alias emacs="emacs -fs"

# Lines configured by zsh-newuser-install
setopt extended_glob
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/evan/.zshrc'
#LESS=-FXRS

autoload -Uz compinit
compinit
# End of lines added by compinstall

#umask 77
#export JAVA_HOME=/usr/lib/jvm/java-1.5.0-sun/
alias grep="grep --color"

export TSOCKS_CONF_FILE=$HOME/.tsocks.conf

export JAVA_HOME=/usr/lib/jvm/java-6-sun/
export JDK_HOME=/usr/lib/jvm/java-6-sun/
export JAVA_VERSION=1.6
export ORACLE_HOME=/usr/lib/oracle/xe/app/oracle/product/10.2.0/server
export EXIST_HOME=$HOME/usr/local/eXist

export PATH=$HOME/Documents/code/toys/fan/fan/bin:$PATH
export PATH=$HOME/bin:$PATH:/usr/java/bin:/usr/local/maven/bin:/usr/share/scala/bin:$ORACLE_HOME/bin
export PATH=$PATH:$EC2_HOME/bin:$HOME/usr/local/jungledisk:$HOME/usr/local/s3cmd
export PATH=$PATH:$HOME/usr/netbeans-6.5/bin
export PATH=/usr/local/scala/bin/:$PATH
export PATH=$PATH:$HOME/.cabal/bin
export PATH=$PATH:~/usr/clojure-contrib/launchers/bash
export PATH=$PATH:~/.luarocks/bin
#set autolist
#export LD_LIBRARY_PATH=/usr/include/alsa/

export EC2_HOME=$HOME/usr/local/ec2
export _EC2_CONF=$HOME/.ec2
export EC2_PRIVATE_KEY=$_EC2_CONF/pk-CCCYZLCHLVZPSKYD7N77AYGHWQKSXRZZ.pem
export EC2_CERT=$_EC2_CONF/cert-CCCYZLCHLVZPSKYD7N77AYGHWQKSXRZZ.pem

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'
fi

# crontab -e uses vi
export VISUAL=vi

# Start screen automatically
export SHELL=zsh
if [ "$TERM" != "screen" ]; then
    exec screen -RR
#    exec screen
#else
#    echo "broke screen startup infinite loop"
fi
