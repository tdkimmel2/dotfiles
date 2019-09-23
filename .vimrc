" ==============================================================
" ==============================================================
" ==============================================================
" vimrc
" ==============================================================
" ==============================================================

syntax on

set clipboard=unnamed

" Rebind <Leader> key
let mapleader = ","

" Map sort function to a key (Alphabetically sort lines selected in visual mode)
vnoremap <Leader>s :sort<CR>

" Set :noh to be <Leader> n in normal mode
nnoremap <Leader>n :noh<CR>

" Better splits and split navigation
set splitbelow
set splitright
nnoremap <Leader>h <C-W><C-H>
nnoremap <Leader>j <C-W><C-J>
nnoremap <Leader>k <C-W><C-K>
nnoremap <Leader>l <C-W><C-L>

" Saving
nnoremap <Leader>Z :xa<CR> " ZZ (:x) for all splits/tabs
nnoremap <Leader>w :w<CR> " Write current file

" Prevent new line creation after 80 characters
set wrap
set textwidth=0

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

" Autoclose quotes, braces, curly braces, and parens
inoremap <Leader>{{ {<CR>}<Esc>ko
inoremap <Leader>{ {}<Left>
inoremap <Leader>( ()<Left>
inoremap <Leader>[ []<Left>
inoremap <Leader>" ""<Left>

" Useful mappings
map <F2> :set nonumber! norelativenumber!<CR> " Toggle number/relative number On and Off
map <F6> :setlocal spell! spelllang=en_us<CR> " Toggle spell checker On and Off

" PEP 8 Indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix
" au BufNewFile,BufRead *.py
"     \ set tabstop=4 |
"     \ set softtabstop=4 |
"     \ set shiftwidth=4 |
"     \ set textwidth=79 |
"     \ set expandtab |
"     \ set autoindent |
"     \ set fileformat=unix

" UTF-8 encoding
set encoding=utf-8



" ==============================================================
" ==============================================================
" Vundle Plugin Stuff
" ==============================================================
" ==============================================================
"
" Need to install Vundle in order to install other plugins with :PluginInstall
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
" $ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
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

" REMEMBER TO RUN :PluginInstall IF SETTING UP ON NEW MACHINE
" If the error - not an editor command - happens then :set filetype=unix

" ==============================================================



" ==============================================================
" ==============================================================
" Plugins
" ==============================================================
" ==============================================================

" Powerline
Plugin 'Lokaltog/powerline' , {'rtp': 'powerline/bindings/vim/'}
"""""""""""" Start Powerline Settings """"""""""""""""

" Make sure powerline uses python3
let g:powerline_pycmd="py3"
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

if has("gui_running")
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
        set guifont=Source\ Code\ Pro\ for\ Powerline:h15
        colorscheme PaperColor              " set color scheme
    endif
endif

""""""""""" END of PowerLine Settings  """""""""""""""



Plugin 'tmhedberg/SimpylFold' " Folding Plugin
Plugin 'vim-syntastic/syntastic' " Check syntax on each save
let g:syntastic_python_python_exec = '/usr/bin/python2.7'
Plugin 'nvie/vim-flake8' " Checks PEP 8 formatting
Plugin 'vim-scripts/indentpython.vim' " Auto indent for Python
Plugin 'w0rp/ale' " Autodetect errors
Plugin 'Valloric/YouCompleteMe'
" YouCompleteMe
" let g:ycm_autoclose_preview_window_after_completion=1
map <Leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>



" Enable Folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
" nnoremap <space> zf

" Enable folding with the Leader f key
" nnoremap <Leader>f za

" Pretty code
let python_highlight_all=1


" ===============================================================
" Colors
" ===============================================================

Plugin 'flazz/vim-colorschemes'

colorscheme gruvbox
set background=dark
" if has('gui_running')
  " set background=dark
  " colorscheme solarized
" else
  " colorscheme zenburn
" endif


" ===============================================================
" C#
" ===============================================================
Bundle 'OmniSharp/omnisharp-vim'
let g:syntastic_cs_checkers = ['code_checker']
let g:ycm_auto_start_csharp_server = 1
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_server_use_mono = 1

" ALE
let g:ale_linters = { 'cs': ['OmniSharp'] }
