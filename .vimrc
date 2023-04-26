""""""""""""""""""""""""""""
" General                  "
""""""""""""""""""""""""""""
syntax on
:filetype plugin indent on


""""""""""""""""""""""""""""
" vim-plug [Plugin Manager]"
""""""""""""""""""""""""""""
call plug#begin()

Plug 'christoomey/vim-tmux-navigator'
Plug 'dense-analysis/ale'
Plug 'fatih/vim-go'
Plug 'leafgarland/typescript-vim'
Plug 'madox2/vim-ai'
Plug 'maralla/completor.vim'
Plug 'pangloss/vim-javascript'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'vim-airline/vim-airline'
Plug 'vim-ruby/vim-ruby'

call plug#end()


""""""""""""""""""""""""""""
" Color                    "
""""""""""""""""""""""""""""
colorscheme vim-monokai-tasty 
let g:airline_theme='monokai_tasty'


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
" Copy Paste Settings      "
""""""""""""""""""""""""""""
set clipboard=unnamedplus


""""""""""""""""""""""""""""
" General Key Bindings "
""""""""""""""""""""""""""""
:imap jk <Esc>


""""""""""""""""""""""""""""
" vim-go settings          "
""""""""""""""""""""""""""""
" Enable lsp for go by using gopls
let g:completor_filetype_map = {}
let g:completor_filetype_map.go = {'ft': 'lsp',  'cmd': 'gopls -remote=auto'}"


""""""""""""""""""""""""""""
" vim-go Key Bindings      "
""""""""""""""""""""""""""""
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage-toggle)
au FileType go nmap <Leader>e <Plug>(go-rename)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>ae <Plug>(go-alternate-edit)
au FileType go nmap <Leader>av <Plug>(go-alternate-vertical)
