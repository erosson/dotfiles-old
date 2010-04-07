set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
" {{{ Makeprg
" Nothing to compile: check syntax
set makeprg=php\ -l\ %
set efm=%m\ in\ %f\ on\ line\ %l 
" }}}

" {{{ Mappings for autogeneration of PHP code

" There are 2 versions available of the code templates, one for the case, that
" the close character mapping is disabled and one for the case it is enabled.

" {{{ With close char mapping activated (currently active)

" require, require_once
map! =req /**<CR> *  <CR>*  <CR>*  <CR>* @since  <CR>*/<CR><LEFT>require '<RIGHT>;<LEFT><Left>
map! =roq /**<CR> *  <CR>*  <CR>*  <CR>* @since  <CR>*/<CR><LEFT>require_once '<RIGHT>;<LEFT><Left>

" include, include_once
map! =inc /**<CR> *  <CR>*  <CR>*  <CR>* @since  <CR>*/<CR><LEFT>include '<RIGHT>;<Left><Left>
map! =ioc /**<CR> *  <CR>*  <CR>*  <CR>* @since  <CR>*/<CR><LEFT>include_once '<Right>;<Left><Left>

" define
map! =def /**<CR> *  <CR>*  <CR>*  <CR>* @since  <CR>* @access public<CR>*/<CR><LEFT>define ('<Right>, '<Right><Right>;<ESC>?',<CR> ')

" class
map! =cla /**<CR> *  <CR>*  <CR>*  <CR>* @since  <CR>*/<CR><LEFT>class  {<CR><ESC>?/\*\*<CR>/ \* <CR>$i

" public/private methods
map! =puf /**<CR> *  <CR>*  <CR>*  <CR>* @since  <CR>* @access public<CR>* @param  <CR>* @return void<CR>*/<CR><LEFT>public function  (<Right><CR>{<CR><ESC>?/\*\*<CR>/ \* <CR>$i
map! =prf /**<CR> *  <CR>*  <CR>*  <CR>* @since  <CR>* @access private<CR>* @param  <CR>* @return void<CR>*/<CR><LEFT>private function _ (<Right><CR>{<CR><ESC>?/\*\*<CR>/ \* <CR>$i

" public/private attributes
map! =pua /**<CR> *  <CR>*  <CR>* @var <CR>* @since  <CR>*/<CR><LEFT>public $ = ;<ESC>?/\*\*<CR>/ \* <CR>$i
map! =pra /**<CR> *  <CR>*  <CR>* @var <CR>* @since  <CR>*/<CR><LEFT>private $_ = ;<ESC>?/\*\*<CR>/ \* <CR>$i

" for loop
map! =for for ($i = 0; $i ; $i++<Right> {<Up><Up><ESC>/ ;<CR>i

" foreach loop
map! =foe foreach ($ as $ => $<Right> {<Up><xHome><ESC>/\ as<CR>i

" while loop
map! =whi while ( <Right> {<Up><Up><ESC>/ )<CR>i

" switch statement
map! =swi switch ($<Right> {<CR>case '<Right>:<CR><CR>break;<CR>default:<CR><CR>break;<Up><Up><Up><Up><Up><Up><Up><xHome><ESC>/)<CR>i

" alternative
map! =if if (<Right> {<Down><xEnd> else {<Up><Up><Up><Up><Up><Up><ESC>/)<CR>i

" }}} With close char mapping activated (currently active)

" {{{ With close char mapping de-activated (currently in-active)

" require, require_once
"map! =req /**<CR> *  <CR>*  <CR>*  <CR>* @since  <CR>*/<CR><LEFT>require '';<ESC>hi
"map! =roq /**<CR> *  <CR>*  <CR>*  <CR>* @since  <CR>*/<CR><LEFT>require_once '';<ESC>hi

" include, include_once
"map! =inc /**<CR> *  <CR>*  <CR>*  <CR>* @since  <CR>*/<CR><LEFT>include '';<ESC>hi
"map! =ioc /**<CR> *  <CR>*  <CR>*  <CR>* @since  <CR>*/<CR><LEFT>include_once '';<ESC>hi

" define
"map! =def /**<CR> *  <CR>*  <CR>*  <CR>* @since  <CR>* @access public<CR>*/<CR><LEFT>define ('', '');<ESC>?',<CR>i

" class
"map! =cla /**<CR> *  <CR>*  <CR>*  <CR>* @since  <CR>*/<CR><LEFT>class  {<CR><CR>}<CR><ESC>?/\*\*<CR>/ \* <CR>$i

" public/private methods
"map! =puf /**<CR> *  <CR>*  <CR>*  <CR>* @since  <CR>* @access public<CR>* @param  <CR>* @return void<CR>*/<CR><LEFT>public function  ()<CR>{<CR><CR>}<CR><ESC>?/\*\*<CR>/ \* <CR>$i
"map! =prf /**<CR> *  <CR>*  <CR>*  <CR>* @since  <CR>* @access private<CR>* @param  <CR>* @return void<CR>*/<CR><LEFT>private function _ ()<CR>{<CR><CR>}<CR><ESC>?/\*\*<CR>/ \* <CR>$i

" public/private attributes
"map! =pua /**<CR> *  <CR>*  <CR>* @var <CR>* @since  <CR>*/<CR><LEFT>public $ = ;<ESC>?/\*\*<CR>/ \* <CR>$i
"map! =pra /**<CR> *  <CR>*  <CR>* @var <CR>* @since  <CR>*/<CR><LEFT>private $_ = ;<ESC>?/\*\*<CR>/ \* <CR>$i

" for loop
"map! =for for ($i = 0; $i ; $i++) {<CR><CR>}<Up><Up><ESC>/ ;<CR>i

" foreach loop
"map! =foe foreach ($ as $ => $) {<CR><CR>}<Up>

" while loop
"map! =whi while ( ) {<CR><CR>}<Up><Up><ESC>/ )<CR>i

" switch statement
"map! =swi switch ($) {<CR>case '':<CR><CR>break;<CR>default:<CR><CR>break;<CR>}<Up><Up><Up><Up><Up><Up><Up><ESC>/)<CR>i

" alternative
"map! =if if () {<CR><CR>} else {<CR><CR>}<Up><Up><Up><Up><Up><Up><ESC>/)<CR>i

" }}} With close char mapping de-activated (currently in-active)

" }}} Mappings for autogeneration of PHP code


