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

call plug#begin('~/.config/nvim/plugged')

Plug 'w0rp/ale'
Plug 'mklabs/split-term.vim'
Plug 'ericbn/vim-solarized'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'

call plug#end()

" vim-solarized theme settings
syntax enable
set background=dark
colorscheme solarized

