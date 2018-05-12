
" For a paranoia. minpac
" Normally `:set nocp` is not needed, because it is done automatically
" when .vimrc is found.
if &compatible
  " `:set nocp` has many side effects. Therefore this should be done
  " only when 'compatible' is set.
  set nocompatible
endif

if exists('*minpac#init')
    call minpac#init()
    call minpac#add('k-takata/minpac', { 'type': 'opt' }) 

    " Fuzzy Finder
    call minpac#add('junegunn/fzf')
    call minpac#add('junegunn/fzf.vim')

    " Navigation/Tags
    call minpac#add('ludovicchabant/vim-gutentags')
    call minpac#add('majutsushi/tagbar')

    " Start Screen
    call minpac#add('mhinz/vim-startify')

    " The mircale to make python indent properly
    call minpac#add('Vimjas/vim-python-pep8-indent')

    " Snippets
    call minpac#add('SirVer/ultisnips')
    call minpac#add('ross-weir/vim-snippets')

    " Auto-complete
    call minpac#add('Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' })
    call minpac#add('zchee/deoplete-jedi')

    " Formatting
    call minpac#add('Yggdroot/indentLine')
    call minpac#add('jiangmiao/auto-pairs')
    call minpac#add('tpope/vim-surround')
    call minpac#add('scrooloose/nerdcommenter')

    call minpac#add('editorconfig/editorconfig-vim')

    " Linting
    call minpac#add('w0rp/ale')

    " Themes
    call minpac#add('lifepillar/vim-solarized8')
    call minpac#add('vim-airline/vim-airline')
    call minpac#add('vim-airline/vim-airline-themes')

    " Semantic highlighting
    call minpac#add('numirias/semshi')

    " File system
    call minpac#add('scrooloose/nerdtree')
    call minpac#add('ryanoasis/vim-devicons')

    " Docker
    call minpac#add('ekalinin/Dockerfile.vim')

    " Git
    call minpac#add('tpope/vim-fugitive')
endif

"" Disable arrows
map <right> <nop> " normal, visual, operation-pending
map <down> <nop>
map <left> <nop>
map <up> <nop>
imap <right> <nop>  " insert mode
imap <down> <nop>
imap <left> <nop>
imap <up> <nop>

hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE
set t_8f=\[[38;2;%lu;%lu;%lum
set t_8b=\[[48;2;%lu;%lu;%lum

" General settings
colorscheme solarized8
set background=dark
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
set termguicolors
set number
set relativenumber
set autoindent
set wrap!
let g:my_snippet_manager = 'ultisnips'
let mapleader = ","
set expandtab

hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE
set t_8f=\[[38;2;%lu;%lu;%lum
set t_8b=\[[48;2;%lu;%lu;%lum

" Key bindings
map <C-n> :NERDTreeToggle<CR>
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>f :GFiles<CR>
nnoremap <leader>c :Commits<CR>
nnoremap <leader>l :Lines<CR>
nnoremap <leader>a :Ag<CR>
nnoremap <leader>t :TagbarOpen fj<CR>
nnoremap <leader>r :TagbarClose<CR>

" ale settings
let g:ale_linters = { 'javascript': ['eslint'], 'python': ['flake8', 'isort'] }

" jsx highlighting in .js files
let g:jsx_ext_required = 0

" FZF
let $FZF_DEFAULT_OPTS = ' --no-height'
let $FZF_DEFAULT_COMMAND = 'fd --type f' 

" Tags
" use fds gitignore files filter
let g:gutentags_file_list_command = 'fd --type f'

let g:EditorConfig_exec_path = '/usr/bin/editorconfig'
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

let g:deoplete#enable_at_startup = 1

" ultisnips settings
let g:UltiSnipsSnippetsDir = '~/.config/nvim/plugged/vim-snippets/UltiSnips'
let g:UltiSnipsSnippetDirectories = 'UltiSnips'
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-b>"
let g:UltiSnipsJumpBackwardTrigger = "<c-z>"
let g:UltiSnipsUsePythonVersion = 3

" nerdtree
let NERDTreeIgnore = ['\.pyc$']

" Define user commands for updating/cleaning the plugins.
" Each of them loads minpac, reloads .vimrc to register the
" information of plugins, then performs the task.
command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
