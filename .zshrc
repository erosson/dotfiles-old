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

