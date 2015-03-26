set nocompatible
filetype plugin indent on
syntax on
let vimclojure#HighlightBuiltins = 1
set tabstop=4
set shiftwidth=4
set expandtab
hi ExtraWhitespace ctermbg=darkgreen
match ExtraWhitespace /\s\+\%#\@<!$/
match ExtraWhitespace /\s\+$\| \+\ze\t/
" match ExtraWhitespace /[^\t]\zs\t\+/
autocmd InsertLeave * redraw!
let c_space_errors = 1

