[ -e ~/.zshrc-local ] && source ~/.zshrc-local

# http://www.faqs.org/docs/bashman/bashref_102.html
set -o emacs

# because we don't want this in git
export NFS_ACCOUNT_NAME=erosson

#alias emacs="emacs --fullscreen"
alias grep="grep --color"
alias ls='ls --color=auto'
alias vi='vim'
alias vim='vim -X'
alias ssh='ssh -2'
alias today='date +%Y%m%d'
alias today-path='date +%Y/%m/%d'
export LESS="-iFRX"
export PATH=$HOME/bin:$PATH:$HOME/.cabal/bin:$HOME/.gem/ruby/1.8/bin:/var/lib/gems/1.8/bin

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

