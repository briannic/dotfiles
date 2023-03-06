""""""""""""""""""""""""""""
" General                  "
""""""""""""""""""""""""""""
:filetype on


""""""""""""""""""""""""""""
" vim-plug [Plugin Manager]"
""""""""""""""""""""""""""""
call plug#begin()

Plug 'fatih/vim-go'

call plug#end()


""""""""""""""""""""""""""""
" Color                    "
""""""""""""""""""""""""""""
colorscheme molokai
let g:molokai_original=1
let g:rehash256=1


""""""""""""""""""""""""""""
" Whitespace Bindings      "
""""""""""""""""""""""""""""
:set tabstop=4
:set shiftwidth=4
:set expandtab


""""""""""""""""""""""""""""
" Makefile Whitespace      "
""""""""""""""""""""""""""""
" In makefiles, don't expand tabs to spaces, since actual tab characters are
" needed, and have indentation at 8 chars to be sure that all indents are tabs
" (despite the mappings later):
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0


""""""""""""""""""""""""""""
" Copy Paste Settings "
""""""""""""""""""""""""""""
set clipboard=unnamedplus


""""""""""""""""""""""""""""
" Key Bindings "
""""""""""""""""""""""""""""
:imap jk <Esc>

