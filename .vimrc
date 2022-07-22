" Options

colorscheme molokai

" Make vim transparent.
"
" Credits: Stefan Völkl answer (https://stackoverflow.com/a/37720708) in https://stackoverflow.com/questions/37712730/set-vim-background-transparent.
"
hi Normal guibg=NONE ctermbg=NONE

" Use syntax highlighting.
syntax enable

" Enable file detection.
filetype on

" Auto-complete commands by typing TAB.
set wildmenu

" Pressing TAB = 4 spaces.
set shiftwidth=4
set tabstop=4

" Use spaces when pressing TAB.
set expandtab

" Use same indent from previous lines.
set autoindent

" Disable compatibility with Vi.
set nocompatible

" Show line numbers relative to the cursor position.
set number relativenumber

" Disable line wrapping.
set nowrap

" Disable folding.
set nofoldenable

" Display in which mode you are (normal, visual, command, insert, etc).
set showmode

" Show patterns matches as you type.
set incsearch

" Make text searches case-insensitive.
set ic

" Highlight pattern matches.
set hlsearch

" Always show the status line.
set laststatus=2

" Encoding format.
set encoding=utf-8

" Status line.
set statusline=File\ :\ %t\ %-y\ Line\ number:\ %l\ \ Percentage\ of\ file:\ %p%%


" Mappings

" Disable arrow keys in (i)nsert mode, (n)ormal mode and (v)isual mode.
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

" Custom key maps.
nnoremap <F2>   :w<CR>
nnoremap <F3>   ggi#!/usr/bin/env bash<ESC>o
nnoremap <F4>   ggi#!/usr/bin/env python3<ESC>o
nnoremap <F7>   :term<CR>
nnoremap <F8>   :marks<CR>
nnoremap <S-F8> :delmark
nnoremap <F10>  :%s/\s\+$//g<CR>
nnoremap <C-s>  ZZ
nnoremap <C-n>  :next<CR>
nnoremap <C-p>  :prev<CR>
nnoremap _      :.,.+
nnoremap ,      :%s///g<Left><Left><Left>
nnoremap ;      :vimgrep //g<Left><Left>

" Copy to system clipboard (See for more information: https://ubuntuforums.org/showthread.php?t=1686955 and https://vim.fandom.com/wiki/Accessing_the_system_clipboard).
noremap <C-k> "+y
