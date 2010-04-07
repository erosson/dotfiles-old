set ai
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
" 'make' uses javac
set makeprg=javac\ %
" Interpret make errors correctly
set efm=%A%f:%l:\ %m,%-Z%p^,%-C%.%#

" Java folding
set foldmethod=syntax
" " Comments
syn region javaCommentFold start="/\*\*" end="\*/" keepend transparent fold
" " Functions
syn region javaFunctionFold start="^\z(\s*\)\(\(public\|protected\|private\|static\|abstract\|final\|native\|synchronized\)[ \n]*\)\+\(\(void\|boolean\|char\|byte\|short\|int\|long\|float\|double\|String\|[A-Z][a-zA-Z]\+\)[ \n]*\)*[ \n]\+[A-Za-z0-9_]*[ \n]*(\_[^)]*)[ \n]*\(\<throws\>[ \n]\+[A-Z]\w\+\([ \n]*,[ \n]*[A-Z]\w\+\)*[ \n]*\)\?[ \n]*\s{" end="^\z1}$" keepend transparent fold

