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

