"
" general Haskell source settings
" (shared functions are in autoload/haskellmode.vim)
"
" (Claus Reinke, last modified: 28/04/2009)
"
" part of haskell plugins: http://projects.haskell.org/haskellmode-vim
" please send patches to <claus.reinke@talk21.com>

" try gf on import line, or ctrl-x ctrl-i, or [I, [i, ..
setlocal include=^import\\s*\\(qualified\\)\\?\\s*
setlocal includeexpr=substitute(v:fname,'\\.','/','g').'.'
setlocal suffixesadd=hs,lhs,hsc

"http://projects.haskell.org/haskellmode-vim/index.html
let g:haddock_browser="opera"
compiler ghc
" Treat 4 spaces like tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set list listchars=tab:>. 
