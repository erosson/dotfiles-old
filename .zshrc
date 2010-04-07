source .zshrc-local

# http://www.faqs.org/docs/bashman/bashref_102.html
set -o emacs

alias emacs="emacs --fullscreen"
alias grep="grep --color"
alias ls='ls --color=auto'
alias vi='vim'
alias vim='vim -X'
alias ssh='ssh -2'
export LESS="-iFRX"

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

# TODO change below things to belkar's .zshrc-local
#export CLOJURE_EXT=~/.clojure
#alias clj=clj-env-dir

#export TSOCKS_CONF_FILE=$HOME/.tsocks.conf

#export JAVA_HOME=/usr/lib/jvm/java-6-sun/
#export JDK_HOME=/usr/lib/jvm/java-6-sun/
#export JAVA_VERSION=1.6
#export ORACLE_HOME=/usr/lib/oracle/xe/app/oracle/product/10.2.0/server
#export EXIST_HOME=$HOME/usr/local/eXist

#export PATH=$HOME/Documents/code/toys/fan/fan/bin:$PATH
#export PATH=$HOME/bin:$PATH:/usr/java/bin:/usr/local/maven/bin:/usr/share/scala/bin:$ORACLE_HOME/bin
#export PATH=$PATH:$EC2_HOME/bin:$HOME/usr/local/jungledisk:$HOME/usr/local/s3cmd
#export PATH=$PATH:$HOME/usr/netbeans-6.5/bin
#export PATH=/usr/local/scala/bin/:$PATH
#export PATH=$PATH:$HOME/.cabal/bin
#export PATH=$PATH:~/usr/clojure-contrib/launchers/bash
#export PATH=$PATH:~/.luarocks/bin
##set autolist
#export LD_LIBRARY_PATH=/usr/include/alsa/

#export EC2_HOME=$HOME/usr/local/ec2
#export _EC2_CONF=$HOME/.ec2
#export EC2_PRIVATE_KEY=$_EC2_CONF/pk-CCCYZLCHLVZPSKYD7N77AYGHWQKSXRZZ.pem
#export EC2_CERT=$_EC2_CONF/cert-CCCYZLCHLVZPSKYD7N77AYGHWQKSXRZZ.pem

# crontab -e uses vi
#export VISUAL=vi

