set foldmethod=syntax
set tabstop=2
set shiftwidth=2
set expandtab

if !exists( "*Ruby_EndToken" )
  function Ruby_EndToken()
    let current_line = getline( '.' )
    let braces_at_end = '{\s*\(|\(,\|\s\|\w\)*|\s*\)\?$'
    if match( current_line, braces_at_end ) >= 0
      return '}'
    else
      return 'end'
    endif
  endfunction
endif
imap <C-L> <ESC>:execute 'normal o' . Ruby_EndToken()<CR>O





