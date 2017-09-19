" Start declaring the encoding of this very file
scriptencoding utf-8
let termencoding="utf-8"

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'drmikehenry/vim-fixkey'
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'junegunn/vim-easy-align'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'davidhalter/jedi-vim'
Plugin 'python-mode/python-mode'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'Shougo/neocomplete'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'vim-airline/vim-airline'
Plugin 'kien/ctrlp.vim'
" color themes
Plugin 'sjl/badwolf'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'morhetz/gruvbox'
call vundle#end()            
filetype plugin indent on   
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal

syntax on
colorscheme badwolf

let mapleader = ","
nnoremap <Leader>a :q!<CR>
nnoremap <Leader>A :qa!<CR>
nnoremap <Leader>s :source $MYVIMRC<CR>
nnoremap <Leader>v :e! $MYVIMRC<CR>
nnoremap <Leader>vv :e! ~/.dotfiles/vimrc<CR>
inoremap <c-s> <ESC>:w<CR>
nnoremap <c-s> :w<CR>
nnoremap <Leader>t :put =strftime('%a, %d %b %Y, %H:%M:%S')<CR> 
nnoremap <F4> :set hlsearch! hlsearch?<CR>
nnoremap <F5> :w<CR>:!clear<CR>:!python %<CR>
" inoremap <F5> <ESC>:w<CR>:!python %<CR>
nnoremap <F6> :w<CR>:!./%<CR>
nnoremap <F9> :w<CR>:!g++ -Wall -pedantic -Wunused -Wextra %<CR>
nnoremap <F10> :!./a.out<CR>
vnoremap < <gv
vnoremap > >gv

" NERDTree
let NERDTreeIgnore = ['\.pyc$', '\.o$', '\.so$', '\.a$', '\.swp', '\.swo', '\.swn', '\.swm', '[a-zA-Z]*egg[a-zA-Z]*', '[a-zA-Z]*cache[a-zA-Z]*']
let NERDTreeShowHidden=1
let g:NERDTreeWinPos="left"
let g:NERDTreeDirArrows=0
noremap <Leader>n :NERDTreeToggle<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
vmap <Enter> <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Noecomplete
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_auto_select = 0
let g:neocomplete#enable_auto_close_preview = 1
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

" python mode plugin
let g:pymode_python = 'python3'
let g:pymode_run_bind = "<Leader>e"
" let g:pymode_rope = 0

" vim-jedi settings 
let g:jedi#auto_initialization = 1
let g:jedi#auto_vim_configuration = 0
let g:jedi#completions_enabled =1
let g:jedi#popup_select_first = 0
let g:jedi#popup_on_dot = 1
let g:jedi#show_call_signatures = 1
autocmd FileType python setlocal completeopt-=preview
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-e>"
let g:jedi#rename_command = "<leader>r"

" airline bar plugin, fix git symbol
" let g:airline_powerline_fonts = 1
let g:airline_symbols_ascii = 1
let g:cb_no_default_brackets = 1

" Ultisnippets
let g:UltiSnipsExpandTrigger="<c-o>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Multi cursor plugin
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
let g:multi_cursor_start_word_key='g<C-n>'


" tmux seamless navigation with vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1
let g:tmux_save_on_switch=1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-o> :TmuxNavigatePrevious<cr>
" au FocusGained * :redraw!
" au FocusLost * :wa

" syntastic settings
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
" nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_mri_args = "--config=$HOME/.jshintrc"
let g:syntastic_python_checkers = [ 'pylint', 'flake8', 'pep8', 'pyflakes', 'python']
let g:syntastic_yaml_checkers = ['jsyaml']
let g:syntastic_html_tidy_exec = 'tidy5'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" fuzzy file finding with :find *[name]
set path+=**
set t_Co=256
set backspace=2
set mouse=a
set history=700
set undolevels=700
set shortmess=at
set autoindent
" save file when using :last, :next, etc.
" set autowrite
" read file when changed externally
set autoread
set colorcolumn=80
set expandtab
set tabstop=4
set ignorecase
set smartcase
set nobackup
set noswapfile
set nowritebackup
set wildmenu
set number 
set relativenumber
set shiftround
set shiftwidth=4
set softtabstop=4
set showmatch
set so=5
" commands like M,H,L... go to first column
set sol

" custom colors for vim-diff
" hi DiffAdd ctermfg=none ctermbg=234
" hi DiffChange term=bold ctermbg=238
" hi DiffDelete ctermfg=124 ctermbg=52
" hi DiffText cterm=bold ctermbg=240
" hi GitGutterChange ctermfg=202 ctermbg=none cterm=bold
" hi GitGutterDelete ctermfg=125 ctermbg=none cterm=bold
" hi GitGutterAdd ctermfg=190 ctermbg=none cterm=bold
