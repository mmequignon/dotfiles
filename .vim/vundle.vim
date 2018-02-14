set nocompatible              " be iMproved, required                                                            
filetype off                  " required                                                                         

" set the runtime path to include Vundle and initialize                                                          
set rtp+=~/.vim/bundle/Vundle.vim                                                                                
call vundle#begin()                                                                                              
Plugin 'VundleVim/Vundle.vim'                                                                                    

Bundle 'mmequignon/nerdtree'                                                                                     
Plugin 'majutsushi/tagbar'
Plugin 'vcscommand.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdcommenter'
Plugin 'qwertologe/nextval.vim'
Plugin 'mbbill/undotree'
Plugin 'rust-lang/rust.vim'
Plugin 'edkolev/tmuxline.vim'
Plugin 'vhdirk/vim-cmake'
Plugin 'davidhalter/jedi-vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'w0rp/ale'

" All of your Plugins must be added before the following line                                                    
call vundle#end()            " required                                                                          
filetype plugin indent on    " required  <F37>
