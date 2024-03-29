"""""""""""""""""""""""""
"       Functions       "
"""""""""""""""""""""""""
function! GetFileType()
    return strlen(&ft) ? &ft : "No file type"
endfunction

"""""""""""""""""""""""""
"       Plugins.        "
"""""""""""""""""""""""""
try
    call plug#begin('~/.local/share/nvim')

    Plug 'Mofiqul/dracula.nvim'
    Plug 'phanviet/vim-monokai-pro'
    Plug 'lervag/vimtex'

    call plug#end()

catch "/Unknown function/"
    echo "vim-plug is misconfigured or missing"

endtry

try
    if has('nvim')
        colorscheme dracula
    else
        colorscheme monokai_pro
    endif

catch "/Cannot find color scheme/"
    echo "Failed to set color scheme"

endtry

let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_method = 'latexmk'

let maplocalleader = ","

autocmd FileType sh set mp=shellcheck\ %

set guioptions-=T
set guioptions-=m
set guioptions-=r
set guioptions-=L

hi MatchParen cterm=underline,bold

hi Normal ctermbg=NONE guibg=NONE
hi Folded ctermbg=NONE guibg=NONE
hi NonText ctermbg=NONE guibg=NONE
hi SpecialKey ctermbg=NONE guibg=NONE
hi VertSplit ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE
hi EndOfBuffer ctermbg=NONE guibg=NONE

syntax enable

filetype plugin indent on

set wildmenu
set wildmode="list:longest"

set expandtab

set tabstop=4
set shiftwidth=4

set autoindent

set number relativenumber

set matchpairs+=<:>
set showmatch

set hlsearch
set incsearch
set ignorecase

set showmode
set encoding=utf-8

set laststatus=2
set statusline=%F
set statusline+=\ [%{GetFileType()}]\ \|
set statusline+=\ (%l,\ %v,\ %p%%)\ Code\ point:\ %B\ \|
set statusline+=\ %{strftime('%d/%m/%y\ %T')}\ \|

call timer_start(1000, {-> execute(':let &stl=&stl')}, {'repeat': -1})

"""""""""""""""""""""""""
"       Mappings        "
"""""""""""""""""""""""""
let mapleader = ","

imap <Left>  <Nop>
imap <Right> <Nop>
imap <Up>    <Nop>
imap <Down>  <Nop>

nmap <Left>  <Nop>
nmap <Right> <Nop>
nmap <Up>    <Nop>
nmap <Down>  <Nop>

vmap <Left>  <Nop>
vmap <Right> <Nop>
vmap <Up>    <Nop>
vmap <Down>  <Nop>

nnoremap <silent> <C-s> :w<CR>

nnoremap <silent> <A-c> :term<CR>
nnoremap <silent> <F5>  :make<CR>

nnoremap <silent> <A-n> :next<CR>
nnoremap <silent> <A-p> :prev<CR>

noremap  <silent> <C-c> "+y
noremap  <silent> <C-p> "+p

nnoremap <Leader>s :s///g<Left><Left><Left>
nnoremap <Leader>f o```<Esc>o```<Esc>O

nnoremap <F7>  :source ""/init.vim . stdpath("config")<CR>
nnoremap <silent> <F8>  :setlocal spell! spelllang=en_us<CR>

"""""""""""""""""""""""""
"         Panes         "
"""""""""""""""""""""""""
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
