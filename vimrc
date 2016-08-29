
" set nocompatible
" filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'airblade/vim-gitgutter'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'chase/vim-ansible-yaml'
Plugin 'chriskempson/base16-vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'elixir-lang/vim-elixir'
Plugin 'fatih/vim-go'
Plugin 'gmarik/Vundle.vim'
Plugin 'godlygeek/tabular'
Plugin 'kchmck/vim-coffee-script'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'mxw/vim-jsx'
Plugin 'ngmy/vim-rubocop'
Plugin 'nvie/vim-flake8'
Plugin 'pangloss/vim-javascript'
Plugin 'pbrisbin/vim-mkdir'
Plugin 'plasticboy/vim-markdown'
Plugin 'rakr/vim-two-firewatch'
Plugin 'rking/ag.vim'
"Plugin 'scrooloose/syntastic'
Plugin 'lambdatoast/elm.vim'
Plugin 'benekastah/neomake'
Plugin 'skalnik/vim-vroom'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vinegar'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Yggdroot/indentLine'

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
set hlsearch
set laststatus=2
set lazyredraw
set magic
set mat=2
set re=1
set foldmethod=indent
set notimeout ttimeout ttimeoutlen=200
set number
set pastetoggle=<F2>
set ruler
set showmatch
set smartcase
set wildmenu
set clipboard=unnamed
set conceallevel=0
set t_Co=256

""""""""""""""""""""""""""""
" COLORS AND FONT "
""""""""""""""""""""""""""""
if (has("termguicolors"))
  set termguicolors
endif
syntax enable
"set encoding=utf8
colorscheme two-firewatch
let g:airline_theme='twofirewatch'
set background=dark

""""""""""""""""""""""""""""
" Neovim "
""""""""""""""""""""""""""""
" Mapping for terminal mode
if has('nvim')
  tnoremap jk <C-\><C-n>
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l
  map <leader>t :terminal<CR>
endif

""""""""""""""""""""""""""""
" Neomake "
""""""""""""""""""""""""""""
autocmd! BufWritePost * Neomake
let g:neomake_open_list = 2
let g:neomake_list_height = 3
let g:neomake_python_flake8_maker = { 'args': ['--ignore=E501,E261,E262'], }

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
" Markdown "
""""""""""""""""""""""""""""
let g:vim_markdown_folding_disabled = 1

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
autocmd Filetype python setlocal ts=4 sts=4 sw=4
autocmd Filetype scss setlocal ts=2 sts=2 sw=2
autocmd Filetype css setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite * :call DeleteTrailingWS()
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
autocmd BufNewFile,BufRead *.tag setlocal ft=javascript

""""""""""""""""""""""""""""
" Key Bindings "
""""""""""""""""""""""""""""
:imap jk <Esc>
map <space> /
map <leader><space> :Ag!
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map q <Nop>
nnoremap j gj
nnoremap k gk
nnoremap <S-J> }
nnoremap <S-K> {

nmap <leader>e :Ex
nmap <leader>y :TagbarToggle<CR>
nnoremap <leader>u :GundoToggle<CR>
map <leader>l :call RunLastSpec()<cr>
map <leader>a :call RunAllSpecs()<cr>
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>
xnoremap <  <gv
xnoremap >  >gv

nnoremap <leader>h :noh<cr>

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
" GIT GUTTER "
""""""""""""""""""""""""""""
" Conflicts with `,h` key
let g:gitgutter_map_keys = 0

""""""""""""""""""""""""""""
" Tagbar "
""""""""""""""""""""""""""""
let g:tagbar_left = 1

""""""""""""""""""""""""""""
" Airline "
""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#syntastic#enabled = 1

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

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
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_coffee_coffeelint_args = '--file ~/.cofeelint.json'
"let g:syntastic_haml_checkers = ['haml_lint']
"let g:syntastic_ruby_checkers = ['rubocop', 'mri']
"let g:syntastic_ruby_rubocop_exec = '/Users/bnichols/.rbenv/shims/ruby /Users/bnichols/.rbenv/shims/rubocop'
"let g:syntastic_loc_list_height = 3

""""""""""""""""""""""""""""
" CTRLP "
""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden --ignore node_modules --ignore .git --ignore .DS_Store -g ""'

""""""""""""""""""""""""""""
" vroom "
""""""""""""""""""""""""""""
let g:vroom_use_vimux = 1

"""""""""""""""""""""""""""
" IndentLine "
""""""""""""""""""""""""""""
let g:indentLine_char = '¦'
let g:indentLine_color_term = 238

