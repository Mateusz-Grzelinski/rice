" Start declaring the encoding of this very file
scriptencoding utf-8

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'junegunn/vim-easy-align'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'davidhalter/jedi-vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'sjl/badwolf'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'Shougo/neocomplete'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'vim-airline/vim-airline'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax on
colorscheme badwolf

let mapleader = ","
inoremap <c-s> <ESC>:w<CR> i
nnoremap <Leader>a :q!<CR>
nnoremap <Leader>s :source $MYVIMRC<CR>
nnoremap <Leader>v :e! $MYVIMRC<CR>
nnoremap <Leader>vv :e! ~/.dotfiles/vimrc<CR>
nnoremap <c-s> :w<CR>
noremap <C-n> :NERDTreeToggle<CR>
nnoremap <F1> :put =strftime('%a, %d %b %Y, %H:%M:%S')<CR> 
nnoremap <F4> :set hlsearch! hlsearch?<CR>
nnoremap <F5> :w<CR>:!clear<CR>:!python %<CR>
inoremap <F5> <ESC>:w<CR>:!python %<CR>
nnoremap <F6> :w<CR>:!./%<CR>
nnoremap <F9> :w<CR>:!g++ -Wall -pedantic -Wunused -Wextra %<CR>
nnoremap <F10> :!./a.out<CR>

" my semi snipets
" nnoremap <Leader>p iprint
inoremap <Leader>p print
inoremap <Leader>s self
" nnoremap Leader>s iself

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" noecomplete
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_auto_select = 0
let g:neocomplete#enable_auto_close_preview = 1
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

" clighter8
let g:clighter8_autostart = 0

" vim-jedi settings 
let g:jedi#auto_initialization = 1
let g:jedi#auto_vim_configuration = 1
let g:jedi#completions_enabled =1
let g:jedi#popup_select_first = 0
let g:jedi#popup_on_dot = 1
let g:jedi#show_call_signatures = 2     " fun arguments in command line

" syntastic settings
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
" nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" airline bar plugin, fix git symbol
" let g:airline_powerline_fonts = 1
let g:airline_symbols_ascii = 1
let g:cb_no_default_brackets = 1

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-o>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" let g:UltiSnipsListSnippets=""

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" fuzzy file finding with :find *[name]
set path+=**

" tmux color enable
set t_Co=256

" windows manipulation inside vim
" turn of that shortcut which overrides mine <C-j>
" it is used in latex for jumping on placeholders
nnoremap <C-S-`> <Plug>IMAP_JumpForward
" nnoremap <C-j> <C-W>j
" noremap <C-k> <C-W>k
" noremap <C-h> <C-W>h
" noremap <C-l> <C-W>l

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

" syntastic default settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs

" normalne backspace i myszka
set backspace=2
set mouse=a

set history=700
set undolevels=700

" number lines, too long lines, tabs width
" set nostartofline
set shortmess=at
" set cmdheight=2
set autoindent
" save file when using :last, :next, etc.
" set autowrite
" read file when changed externally
set autoread
set colorcolumn=80
set expandtab
set tabstop=4
" if a pattern contains an uppercase letter, it is case sensitive, otherwise, it
" is not
set ignorecase
set smartcase
" treat numbers as dec or hex (0x)
" set nrformats="hex alpha"
" delete backups
set nobackup
set noswapfile
set nowritebackup
set wildmenu
set number 
set relativenumber
set shiftround
set shiftwidth=4
set showmatch
set so=5
set softtabstop=4
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
