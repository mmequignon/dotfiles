set nocompatible
set title
"------------------------------------------------------------
"ENCODING
"------------------------------------------------------------

set encoding=utf-8
set fileencoding=utf-8

"-------------------------------------------------------------
" esthétique 
"-------------------------------------------------------------

" lignes / colonnes
set number
set nowrap
set mouse=a
let mapleader=","
let maplocalleader=";"

"ajouter de la couleur
syntax enable
let python_highlight_all = 1

set termguicolors
set background=dark
colorscheme solarized8_high

" Commencer à chercher dès qu'on tape un texte de recherche
set incsearch 
" Surligner les résultats d'une recherche
set hlsearch 
" Ne pas tenir compte de la casse ...
set ignorecase 
" ... sauf si on tape des majuscules
set smartcase

" tabulations
set expandtab           " enter spaces when tab is pressed                                                                  
set tabstop=4           " use 4 spaces to represent tab                                                                     
set softtabstop=4 
set shiftwidth=4        " number of spaces to use for auto indent      
set showcmd                     " show (partial) command in status line                                                     


set colorcolumn=80
set cursorline
set fileformat=unix
set hid

set noswapfile


"--------------------------------------------------------------
" gVim
" -------------------------------------------------------------
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set guifont=TerminessTTF\ Nerd\ Font\ Mono\ 20
