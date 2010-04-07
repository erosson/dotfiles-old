" Treat 4 spaces like tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
" Autoindent after :
"set smartindent
" Display tabs special-like
set list listchars=tab:>. 
" 80 chars
set textwidth=79

set formatoptions=tc

" set iskeyword+=.

" highlighting...
let python_highlight_space_errors=1

source $HOME/.vim/ftplugin/extra/python_keymaps.vim
source $HOME/.vim/ftplugin/extra/python_folding.vim
"source $HOME/.vim/ftplugin/extra/python_exec.vim
