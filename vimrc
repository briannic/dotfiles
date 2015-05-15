set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'chrisbra/csv.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'fatih/vim-go'
Plugin 'gmarik/Vundle.vim'
Plugin 'godlygeek/tabular'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'ngmy/vim-rubocop'
Plugin 'pbrisbin/vim-mkdir'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/syntastic'
Plugin 'sjl/gundo.vim'
Plugin 'techlivezheng/vim-plugin-minibufexpl'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vim-ruby/vim-ruby'

call vundle#end()

filetype plugin on
filetype indent on

let mapleader=","
let g:mapleader=","
nnoremap ; :

nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

""""""""""""""""""""""""""""
" VIM USER INTERFACE "
""""""""""""""""""""""""""""
set autoread
set cmdheight=2
set foldmethod=syntax
set nofoldenable
set hid
set history=700
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set magic
set mat=2
set notimeout ttimeout ttimeoutlen=200
set number
set pastetoggle=<F2>
set relativenumber
set ruler
set showmatch
set smartcase
set wildmenu
set clipboard=unnamed

""""""""""""""""""""""""""""
" COLORS AND FONT "
""""""""""""""""""""""""""""
syntax enable
set encoding=utf8
set background=dark
colorscheme Tomorrow-Night

""""""""""""""""""""""""""""
" TMUX "
""""""""""""""""""""""""""""
if exists('$ITERM_PROFILE')
  if exists('$TMUX')
    let &t_SI = "\<Esc>[3 q"
    let &t_EI = "\<Esc>[0 q"
  else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  endif
end

""""""""""""""""""""""""""""
" Files and backup "
""""""""""""""""""""""""""""
set nobackup
set nowb
set noswapfile

""""""""""""""""""""""""""""
" Text, tab and indent "
""""""""""""""""""""""""""""
set expandtab
set smarttab
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype python setlocal ts=4 sts=4 sw=4
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite * :call DeleteTrailingWS()

""""""""""""""""""""""""""""
" Key Bindings "
""""""""""""""""""""""""""""
:imap jk <Esc>
map <space> /
map <leader><space> :Ag
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map q <Nop>
nnoremap j gj
nnoremap k gk
nnoremap <S-J> }
nnoremap <S-K> {

nmap <leader>r :RuboCop<CR>
nmap <leader>y :TagbarToggle<CR>
nnoremap <leader>u :GundoToggle<CR>
map <leader>t :call RunCurrentSpecFile()<cr>
map <leader>l :call RunLastSpec()<cr>
map <leader>a :call RunAllSpecs()<cr>

""""""""""""""""""""""""""""
" Buffers "
""""""""""""""""""""""""""""
map <leader>bd :Bclose<cr>
map <leader>ba :%bd!<cr>
nmap <leader>bq :bp <BAR> bd #<CR>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
   \ if line("'\"") > 0 && line("'\"") <= line("$") |
   \   exe "normal! g`\"" |
   \ endif
" Remember info about open buffers on close
set viminfo^=%

""""""""""""""""""""""""""""
" Airline "
""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

""""""""""""""""""""""""""""
" SYNTASTIC "
""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
let g:syntastic_coffee_coffeelint_args = '--file ~/.cofeelint.json'
let g:syntastic_haml_checkers = ['haml_lint']
let g:syntastic_ruby_checkers = ['rubocop', 'mri']
let g:syntastic_ruby_rubocop_exec = '/Users/bnichols/.rbenv/shims/ruby /Users/bnichols/.rbenv/shims/rubocop'
let g:syntastic_loc_list_height = 3

""""""""""""""""""""""""""""
" CTRLP "
""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

""""""""""""""""""""""""""""
" VIM rspec "
""""""""""""""""""""""""""""
let g:rspec_runner = "os_x_iterm"
