" ==============================================================
" Vundle Plugin Stuff
" ==============================================================
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" ==============================================================

" ==============================================================
" Plugins
" ==============================================================
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" Powerline
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set t_Co=256

syntax on

set clipboard=unnamed

" Rebind <Leader> key
let mapleader = ","

" Map sort function to a key (Alphabetically sort lines selected in visual mode)
vnoremap <Leader>s :sort<CR>

" Better splits and split navigation
set splitbelow
set splitright
nnoremap <Leader>j <C-W><C-J>
nnoremap <Leader>k <C-W><C-K>
nnoremap <Leader>l <C-W><C-L>
nnoremap <Leader>h <C-W><C-H>

" Saving
nnoremap <Leader>Z :xa<CR> " ZZ (:x) for all splits/tabs
nnoremap <Leader>w :w<CR> " Write current file

" Tab blocks of code without deselecting it
vnoremap < <gv " Better indentation
vnoremap > >gv " Better indentation
" Tab/Indent Customization
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

set number relativenumber

" Useful mappings
map <F2> :set nonumber! norelativenumber!<CR> " Toggle number/relative number On and Off
map <F6> :setlocal spell! spelllang=en_us<CR> " Toggle spell checker On and Off

" Powerline
let g:powerline_pycmd="py"

" ==================================================
" Python IDE
" ==================================================

" ==============================================================
" Plugins
" ==============================================================
Plugin 'tmhedberg/SimpylFold' " Folding Plugin
Plugin 'vim-syntastic/syntastic' " Check syntax on each save
Plugin 'nvie/vim-flake8' " Checks PEP 8 formatting
Plugin 'vim-scripts/indentpython.vim' " Auto indent for Python


" Enable Folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
nnoremap <space> zf

" Enable folding with the Leader f key
" nnoremap <Leader>f za

" PEP 8 Indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" UTF-8 encoding
set encoding=utf-8

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
map <Leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Pretty code
let python_highlight_all=1
