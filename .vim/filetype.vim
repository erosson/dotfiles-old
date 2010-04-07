" my filetype file
if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    "au! BufRead,BufNewFile *.mako     setfiletype mako
    au! BufRead,BufNewFile *.fan     setfiletype fan
augroup END
