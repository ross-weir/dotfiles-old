" Automatically install Plugin Manager
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" General settings
set termguicolors
set number

" Key bindings
map <C-n> :NERDTreeToggle<CR>

autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 expandtab

call plug#begin('~/.config/nvim/plugged')

"Plug 'jelera/vim-javascript-syntax'
Plug 'othree/yajs.vim'
"Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'jiangmiao/auto-pairs'
Plug 'w0rp/ale'
Plug 'itchyny/lightline.vim'
Plug 'ericbn/vim-solarized'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'

call plug#end()

" vim-solarized theme settings
syntax enable
set background=dark
colorscheme solarized

let g:ale_linters = { 'javascript': ['eslint'] }
