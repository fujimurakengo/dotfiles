"Encode
set fileencodings=utf-8,sjis
set fileencoding=utf-8
set encoding=utf-8
scriptencoding utf-8

"Plugin
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    echo "install NeoBundle..."
    :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
  endif
endif

call neobundle#begin(expand('~/.vim/bundle/'))
  NeoBundleFetch 'Shougo/neobundle.vim'
  NeoBundle 'scrooloose/nerdtree'
  NeoBundle 'bronson/vim-trailing-whitespace'
  NeoBundle 'Yggdroot/indentLine'
call neobundle#end()
filetype plugin indent on
NeoBundleCheck

"Indent
set autoindent
set expandtab
set tabstop=2
set softtabstop=2
set smartindent
set shiftwidth=2

"Show Setting
set cursorline
set showmatch
set noswapfile
set title
set number
set clipboard=unnamed,autoselect
set showmatch matchtime=1
set laststatus=2
set showcmd
augroup source-vimrc
	autocmd!
		autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
	autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END
set incsearch
set wildmenu wildmode=list:full

"Search
set hlsearch
set incsearch
set wrapscan
set smartcase
set ignorecase

"Other
nnoremap ! :!

"Tag close
filetype plugin on
augroup html_closetag
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype eruby inoremap <buffer> </ </<C-x><C-o>
augroup END

"NERDTree
nnoremap <Space>f :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
