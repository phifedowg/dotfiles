" Vim settings
set nocompatible              " be iMproved, required
filetype off                  " required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage itself
Plugin 'VundleVim/Vundle.vim'

" Add your plugins here
Plugin 'tpope/vim-fugitive'   " Git wrapper
Plugin 'dense-analysis/ale'   " Linting and fixing
Plugin 'scrooloose/nerdtree'  " File system explorer

" All plugins must be added before the following line
call vundle#end()
filetype plugin indent on    " required

" Global settings
set number                    " Show line numbers
set relativenumber             " Show relative line numbers
set wrap                      " Wrap long lines
set showcmd                   " Show (partial) command in status line
set wildmenu                  " Enhanced command line completion
set lazyredraw                " Redraw only when necessary
set tabstop=4                 " Number of spaces that a <Tab> in the file counts for
set shiftwidth=4              " Number of spaces to use for each step of (auto)indent
set expandtab                 " Use spaces instead of tabs
set smartindent               " Do smart autoindenting when starting a new line
set autoindent                " Copy indent from current line when starting a new line
set smartcase                 " Do smart case matching when searching
set ignorecase                " Do case insensitive matching when searching
set hlsearch                  " Highlight search results
set incsearch                 " Incremental search
set showmatch                 " Show matching brackets

" Auto commands
autocmd FileType yaml,yml setlocal ts=2 sts=2 sw=2 et ai  " YAML indent settings

" NERDTree configuration
autocmd vimenter * NERDTree   " Open NERDTree when Vim starts
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Key mappings
nnoremap <C-n> :NERDTreeToggle<CR>  " Map Ctrl+n to toggle NERDTree

" Colorscheme (optional, uncomment to use)
" colorscheme desert

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" See :h vundle for more details or wiki for FAQ
