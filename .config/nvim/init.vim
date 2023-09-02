"""""""""""""""""""""""""
"       Plugins.        "
"""""""""""""""""""""""""
try
    call plug#begin('~/.local/share/nvim')

    Plug 'Mofiqul/dracula.nvim'
    Plug 'phanviet/vim-monokai-pro'

    call plug#end()

    colorscheme dracula

catch "/Unknown function/"
    echo "vim-plug is misconfigured or missing"

endtry

autocmd BufReadPre,BufNewFile *.bash,*.sh set mp=shellcheck\ -f\ gcc\ -x

try
    b:editorconfig["trim_trailing_whitespace"]

catch
    autocmd BufWritePre,BufReadPre *.bash,*.sh :%s/\s\+$//e

endtry

set guioptions-=T
set guioptions-=m

hi MatchParen cterm=underline,bold

" Transparency.
"
" Credits to: u/Itwist101
" URL: https://www.reddit.com/r/neovim/comments/ncv6oj/comment/gy77nhx/?utm_source=share&utm_medium=web2x&context=3
"
hi Normal ctermbg=none guibg=none
hi Folded ctermbg=none guibg=none
hi NonText ctermbg=none guibg=none
hi SpecialKey ctermbg=none guibg=none
hi VertSplit ctermbg=none guibg=none
hi SignColumn ctermbg=none guibg=none
hi EndOfBuffer ctermbg=none guibg=none

syntax enable

filetype on
filetype plugin on
filetype indent on

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
set statusline=%t\ %-y\ \|\ (%l,\ %v,\ %p%%)\ \|\ %{strftime('%d/%m/%y\ %T')}\ \|

" Credits to: Christian Brabandt
" URL: https://vi.stackexchange.com/a/17876
call timer_start(1000, {-> execute(':let &stl=&stl')}, {'repeat': -1})

"""""""""""""""""""""""""
"       Mappings        "
"""""""""""""""""""""""""
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

nnoremap _     :.,.+
nnoremap ,     :%s///g<Left><Left><Left>
nnoremap <F10> :%s/\s\+$//g<CR>

nnoremap <F7>  :source ""/init.vim . stdpath("config")<CR>
nnoremap <silent> <F8>  :setlocal spell! spelllang=en_us<CR>

"""""""""""""""""""""""""
"         Panes         "
"""""""""""""""""""""""""

nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
