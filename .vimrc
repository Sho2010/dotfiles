"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'chriskempson/vim-tomorrow-theme'

NeoBundle 'scrooloose/nerdtree'

" コメントON/OFFを手軽に実行
NeoBundle 'tomtom/tcomment_vim'

" Ruby向けにendを自動挿入してくれる
NeoBundle 'tpope/vim-endwise'

" 囲むやつ
NeoBundle 'tpope/vim-surround'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------



"=======================================================
" colorscheme
" ------------------------------------------------------
syntax on
set background=dark
if ($ft=='ruby')
  colorscheme Tomorrow-Night
else
  colorscheme hybrid
endif

set number
set clipboard+=unnamed
set tabstop=2
set autoindent
set expandtab

"バックスペースで改行とかも消せる"
set backspace=indent,eol,start
set ignorecase  
set smartcase  

"backup,swap fileいらない 
set nowritebackup
set nobackup
set noswapfile

"検索関係
set ignorecase	" 大文字小文字を区別しない
"set smartcase 	" 検索文字に大文字がある場合は大文字小文字を区別
set incsearch 	" インクリメンタルサーチ
set hlsearch  	
set wrapscan            " 検索時にファイルの最後まで行ったら最初に戻る

"=======================================================
" tcomment_vim / comment out shortcut 
"------------------------------------------------------
"noremap <c-/><c-/>  :TComment<CR>

