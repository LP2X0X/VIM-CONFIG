set clipboard^=unnamed " Set clipboard = unnamedplus " To always use clipboard for all operation
set number " For number of lines
set backspace=indent,eol,start " For using backspace
set nocompatible " Turns off legacy vi mode
set encoding=UTF-8
set nospell " Set no spellcheck
filetype off " Required!

" Set the runtime path to include Vundle and initialize
set rtp+=C:/Users/LP2X0X/vimfiles/bundle/vundl/
call vundle#begin() " Begin of plugins list

Plugin 'lambdalisue/vim-fullscreen'
Plugin 'gmarik/Vundle.vim'
Plugin 'morhetz/gruvbox'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'dense-analysis/ale'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'ryanoasis/vim-devicons'

call vundle#end() " End of plugin list
filetype plugin indent on     " Required!

autocmd vimenter * ++nested colorscheme gruvbox " Set the color scheme
set bg=dark

set undofile " For undo after reboot

au BufNewFile,BufRead *.py set tabstop=4|set softtabstop=4|set shiftwidth=4|set textwidth=0 |set expandtab|set autoindent|set fileformat=unix

highlight  BadWhitespace ctermbg=red guibg=red

au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

let python_highlight_all=1
"syntax on
if !exists('g:syntax_on')
	syntax enable
endif

let g:ale_linters = {
			\ 'python': ['flake8', 'pylint'],
			\ 'ruby': ['standardrb', 'rubocop'],
			\ 'javascript': ['eslint'],
			\}
let g:ale_fixers = {
			\    'python': ['yapf'],
			\}

set foldenable
set foldmethod=indent
set foldlevel=99


au VimEnter * NERDTree D:\


set complete+=kspell
set completeopt=menuone,longest
set spelllang=en


" HOTKEYS
" Spell check
map <F1> :setlocal spell!<CR> 
" Map NERDTree to F2
map <F2> :NERDTreeToggle<CR> 
" Full screen mode toggle
map <F3> <C-Enter>
" Highlight search toggle
noremap <F4> :set hlsearch! hlsearch?<CR>
" Run Python code
imap <F5> <Esc>:w<CR>:!python %<CR>
nmap <F5> <Esc>:w<CR>:!python %<CR>
" Remap arrow keys to resize window
nnoremap <Up>    :resize -1<CR>
nnoremap <Down>  :resize +1<CR>
nnoremap <Left>  :vertical resize -1<CR>
nnoremap <Right> :vertical resize +1<CR>

" Configure for spell check
hi SpellBad cterm=underline "ctermfg=203 guifg=#ff5f5f 
hi SpellLocal cterm=underline "ctermfg=203 guifg=#ff5f5f 
hi SpellRare cterm=underline "ctermfg=203 guifg=#ff5f5f 
hi SpellCap cterm=underline "ctermfg=203 guifg=#ff5f5f

let g:lightline = {
      \ 'colorscheme': 'one',
      \ }

set laststatus=2 "Always on Lightline"

set shortmess+=A "For swap file pop-up error
set hlsearch
set wildmenu	
set incsearch
set shortmess-=S "Show match count

set tabstop=4
set softtabstop=4
set shiftwidth=4

set scrolloff=5
set history=700

" SYNTASTIC Configure
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" VIMDEVICONS CONFIG
let g:webdevicons_enable = 1
set conceallevel=3
let g:webdevicons_conceal_nerdtree_brackets = 1
