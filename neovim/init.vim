" Automatically install Plugin Manager
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugin list
call plug#begin('~/.config/nvim/plugged')

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-startify'
Plug 'SirVer/ultisnips'
Plug 'ross-weir/vim-snippets'
Plug 'Yggdroot/indentLine'
Plug 'ternjs/tern_for_vim'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'editorconfig/editorconfig-vim'
"Plug 'jelera/vim-javascript-syntax'
Plug 'othree/yajs.vim'
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'itchyny/lightline.vim'
Plug 'ericbn/vim-solarized'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'

call plug#end()

" General settings
set termguicolors
set number
set relativenumber
let g:my_snippet_manager = 'ultisnips'
let mapleader = ","

" Key bindings
map <C-n> :NERDTreeToggle<CR>
nnoremap <leader>y "+y
vnoremap <leader>y "+y

" Auto commands
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 expandtab

" vim-solarized theme settings
syntax enable
set background=dark
colorscheme solarized

" ale settings
let g:ale_linters = { 'javascript': ['eslint'] }

" jsx highlighting in .js files
let g:jsx_ext_required = 0

let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

let g:deoplete#enable_at_startup = 1

" ultisnips settings
let g:UltiSnipsSnippetsDir = '~/.config/nvim/plugged/vim-snippets/UltiSnips'
let g:UltiSnipsSnippetDirectories = 'UltiSnips'
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-b>"
let g:UltiSnipsJumpBackwardTrigger = "<c-z>"
let g:UltiSnipsUsePythonVersion = 3
