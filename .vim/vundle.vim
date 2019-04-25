set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" SIDEBARS
Bundle 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'majutsushi/tagbar'
Plugin 'mbbill/undotree'

" GIT
Plugin 'mhinz/vim-signify'

"APPARENCE
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'edkolev/tmuxline.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'severin-lemaignan/vim-minimap'

" COMPLETION
Plugin 'w0rp/ale'
Plugin 'Shougo/deoplete.nvim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" LANGAGES
"RUST
Plugin 'rust-lang/rust.vim'
" NIX
Plugin 'LnL7/vim-nix'

" MANIPULATION
Plugin 'scrooloose/nerdcommenter'
Plugin 'terryma/vim-multiple-cursors'
" Cherche des fichiers
Plugin 'junegunn/fzf.vim'
" Recherche des patterns dans les fichiers
Plugin 'mileszs/ack.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required  <F37>
