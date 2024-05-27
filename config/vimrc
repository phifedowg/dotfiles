" Enable improved Vi compatibility
set nocompatible

" Disable automatic file type detection (required before setting up Vundle)
filetype off

" Set the runtime path to include Vundle and initialize it
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" List of plugins managed by Vundle
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'file:///home/gmarik/path/to/plugin'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'dense-analysis/ale'
Plugin 'preservim/nerdtree'
Plugin 'itchyny/lightline.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'tpope/vim-commentary'
Plugin 'terryma/vim-multiple-cursors'

" End Vundle setup
call vundle#end()

" Enable file type detection and plugins
filetype plugin indent on

" Enable syntax highlighting
syntax on

" General Settings
set number
set hlsearch
set incsearch
set showmatch
set undofile
set clipboard=unnamedplus
set autoindent
set smartindent
set ignorecase
set smartcase
set laststatus=2

" YAML-specific settings
autocmd FileType yaml,yml setlocal ts=2 sts=2 sw=2 et ai

" General settings for indentation
setlocal ts=2 sts=2 sw=2 et ai

" Enable color column at 80 characters and cursor column
set cursorcolumn

" Disable mouse support
set mouse=
