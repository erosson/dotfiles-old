" http://marc2.theaimsgroup.com/?l=vim-dev&m=114079412117809&w=2

syntax clear javaBraces
syntax clear javaDocComment
set foldnestmax=2

syn region javaBraces     start="{"     end="}"   transparent fold
"syn region javaDocComment start="/\*\*" end="\*/" keepend
syn region javaDocComment start="/\*\*" end="\*/" transparent keepend fold
"contains=javaCommentTitle,@javaHtml,javaDocTags,javaDocSeeTag,javaTodo,@
"Spell fold

