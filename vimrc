scriptencoding utf-8
let termencoding="utf-8"

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" Completions & snips
Plugin 'honza/vim-snippets'
Plugin 'Shougo/neocomplete'
Plugin 'SirVer/ultisnips'
" Syntax & languages
Plugin 'w0rp/ale'
Plugin 'python-mode/python-mode'
Plugin 'davidhalter/jedi-vim'
Plugin 'Shougo/echodoc.vim'
Plugin 'Shougo/context_filetype.vim'
" Plugin 'scrooloose/syntastic'
Plugin 'janko-m/vim-test'
Plugin 'tpope/vim-dispatch'
" Utils
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'junegunn/vim-easy-align'
Plugin 'majutsushi/tagbar'
" Plugin 'Raimondi/delimitMate'
Plugin 'jiangmiao/auto-pairs'
Plugin 'airblade/vim-gitgutter'
Plugin 'sjl/gundo.vim'
Plugin 'nathanaelkane/vim-indent-guides'
" Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kien/ctrlp.vim'
" tacahiroy/ctrlp-funky " ctrlp like function definition matching
Plugin 'drmikehenry/vim-fixkey'
" Color themes
Plugin 'sjl/badwolf'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'morhetz/gruvbox'
call vundle#end()            
filetype plugin indent on   

syntax on
colorscheme lucius
set background=dark
let g:airline_theme='lucius'

let mapleader = ","
nnoremap <Leader>a :q!<CR>
nnoremap <Leader>A :qa!<CR>
nnoremap <Leader>s :source $MYVIMRC<CR>
nnoremap <Leader>v :e! $MYVIMRC<CR>
nnoremap <Leader>vv :e! ~/.dotfiles/vimrc<CR>
nnoremap <Leader>pl :PymodeLintAuto<CR>
nnoremap <Leader>t :put =strftime('%a, %d %b %Y, %H:%M:%S')<CR> 
" nnoremap <CR> o<ESC>
nnoremap o o<ESC> " alt-o
inoremap <c-s> <ESC>:w<CR>
nnoremap <c-s> :w<CR>
nnoremap <F4> :set hlsearch! hlsearch?<CR>
nnoremap <F5> :w<CR>:!clear<CR>:!python %<CR>
nnoremap <F6> :w<CR>:!./%<CR>
nnoremap <F9> :w<CR>:!g++ -Wall -pedantic -Wunused -Wextra %<CR>
nnoremap <F10> :!./a.out<CR>
nnoremap <Leader>er :Errors <CR>
map <C-w>+ <C-W>10+
map <C-w>- <C-W>10-
map <C-w>< <C-W>5<
map <C-w>> <C-W>5>

nnoremap <S-F1> :mksession! ./.vim_session <CR>   
nnoremap <S-F2> :source ./.vim_session <CR>      

" From https://github.com/rafi/vim-config/
" Tabs
nnoremap <silent> g0 :<C-u>tabfirst<CR>
nnoremap <silent> g$ :<C-u>tablast<CR>
nnoremap <silent> gr :<C-u>tabprevious<CR>
nnoremap <silent> <A-j> :<C-U>tabnext<CR>
nnoremap <silent> <A-k> :<C-U>tabprevious<CR>
nnoremap <silent> <C-Tab> :<C-U>tabnext<CR>
nnoremap <silent> <C-S-Tab> :<C-U>tabprevious<CR>
" Uses g:lasttab set on TabLeave in MyAutoCmd
let g:lasttab = 1
nmap <silent> \\ :execute 'tabn '.g:lasttab<CR>

" Remove spaces at the end of lines
nnoremap <silent> <Leader><Space> :<C-u>silent! keeppatterns %substitute/\s\+$//e<CR>
    
" Easymotion
map f <Plug>(easymotion-f)
map F <Plug>(easymotion-F)

" NERDTree
let NERDTreeIgnore = ['\.pyc$', '\.o$', '\.so$', '\.a$', '\.swp', '\.swo', '\.swn', '\.swm', '[a-zA-Z]*egg[a-zA-Z]*', '[a-zA-Z]*cache[a-zA-Z]*']
let NERDTreeShowHidden=1
let g:NERDTreeWinPos="left"
let g:NERDTreeDirArrows=0
noremap <F1> :NERDTreeToggle<CR>
" NERDTree-git
let g:NERDTreeShowGitStatus = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Start interactive EasyAlign in visual mode (e.g. vipga)
vmap <Enter> <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Gundo
set undodir=~/.vim/tmp/undo/
set history=700
set undolevels=700
set undofile

" Ale
let g:airline#extensions#ale#enabled = 1
let g:ale_sh_shell_default_shell='bash'
" Map movement through errors without wrapping.
nmap <silent> k <Plug>(ale_previous)
nmap <silent> j <Plug>(ale_next)
" OR map keys to use wrapping.
" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Tagbar 
nmap <F2> :TagbarToggle<CR>

" Echhodoc
set noshowmode
" set cmdheight=2
let g:echodoc_enable_at_startup = 1

" Indent guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" Noecomplete
let g:acp_enableAtStartup = 1
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_auto_select = 0
let g:neocomplete#enable_auto_close_preview = 1
let g:neocomplete#enable_camel_case = 1
" inoremap <expr><C-g>     neocomplcache#undo_completion()
" inoremap <expr><C-l>     neocomplcache#complete_common_string()
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" python mode plugin
let g:pymode_python = 'python3'
let g:pymode_run_bind = "<Leader>e"
let g:pymode_rope_completion = 0
let g:pymode_lint = 1
let g:pymode_lint_cwindow = 0
let g:pymode_doc = 0
let g:pymode_rope = 1

" vim-jedi settings 
let g:jedi#auto_initialization = 1
" let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 1
let g:jedi#show_call_signatures = 2
if has('python3')
    let g:jedi#force_py_version = 3
endif
autocmd FileType python setlocal completeopt-=preview
autocmd FileType python setlocal completeopt+=noinsert
autocmd FileType python setlocal omnifunc=jedi#completions "pythoncomplete#Complete
" set completeopt=longest,menu,menuone,noinsert,noselect

" vim-test
nmap <silent> <leader>tt :TestNearest<CR>
nmap <silent> <leader>tT :TestFile<CR>
nmap <silent> <leader>ta :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tg :TestVisit<CR>
" make test commands execute using dispatch.vim
let test#strategy = "dispatch"
let test#python#runner = 'pytest'
" Runners available are 'pytest', 'nose', 'nose2', 'djangotest', 'djangonose' and Python's built-in 'unittest'
let g:test#python#pytest#options = "-v"

" airline bar plugin, fix git symbol
" let g:airline_powerline_fonts = 1
let g:airline_symbols_ascii = 1
let g:cb_no_default_brackets = 1

" Ultisnippets
" custom snips
let g:UltiSnipsExpandTrigger="<c-o>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
set rtp+=~/.dotfiles/my_snips
let g:UltiSnipsSnippetsDir="~/.dotfiles/my_snips/UltiSnips"
let g:UltiSnipsEditSplit="vertical"

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

" " syntastic settings
" let g:syntastic_mode_map = { 'mode': 'active', 
"             \ 'passive_filetypes': ["python"] }
" " nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 2
" " let g:syntastic_check_on_open = 1
" " let g:syntastic_check_on_wq = 1
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_mri_args = "--config=$HOME/.jshintrc"
" let g:syntastic_python_checkers = [ 'pylint', 'flake8', 'pep8', 'pyflakes', 'python']
" let g:syntastic_yaml_checkers = ['jsyaml']
" let g:syntastic_html_tidy_exec = 'tidy5'
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" fuzzy file finding with :find *[name]
set path+=**
set t_Co=256
set backspace=2
set mouse=a
set shortmess=at
set autoindent
set clipboard=unnamed
set autoread
set colorcolumn=80
set expandtab
set ignorecase
set smartcase
set incsearch
set nobackup
set noswapfile
set nowritebackup
set wildmenu
set wildignore+=*.a,*.o
set wildignore+=*.bmp,*.gif,*.ico,*.png,*.jpg
set wildignore+=*.git,*.tmp
set number 
set relativenumber
set shiftround
set shiftwidth=4
set softtabstop=4
set tabstop=4
set showmatch
set so=5
" commands like M,H,L... go to first column
set sol
