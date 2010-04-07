set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Fold functions
set foldmethod=syntax
" syn region shellFunctionFold start="^\z(\s*\)\(\(public\|protected\|private\|static\|abstract\|final\|native\|synchronized\)[ \n]*\)\+\(\(void\|boolean\|char\|byte\|short\|int\|long\|float\|double\|String\|[A-Z][a-zA-Z]\+\)[ \n]*\)*[ \n]\+[A-Za-z0-9_]*[ \n]*(\_[^)]*)[ \n]*\(\<throws\>[ \n]\+[A-Z]\w\+\([ \n]*,[ \n]*[A-Z]\w\+\)*[ \n]*\)\?[ \n]*\s{" end="^\z1}$" keepend transparent fold
syn region shellFunctionFold start="^\z(\s*\)\w*\s*()[\s\n]*{" end="^\z1}" keepend transparent fold	

