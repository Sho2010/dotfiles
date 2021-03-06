if &compatible
  set nocompatible
endif

" dein auto install
let s:dein_repo_dir   = expand('~/.dein/repos/github.com/Shougo/dein.vim')
let s:dein_plugin_dir = expand('~/.dein/plugins')

if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif

" set runtimepath+=s:dein_repo_dir
let &runtimepath = s:dein_repo_dir .",". &runtimepath

if dein#load_state(s:dein_plugin_dir)
  call dein#begin(s:dein_plugin_dir)
  call dein#add(s:dein_repo_dir)

  call dein#load_toml('~/.config/dein/lazy.toml',      {'lazy': 1})
  call dein#load_toml('~/.config/dein/go_lazy.toml'  , {'lazy': 1})

  " call dein#add('Shougo/neocomplete.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  call dein#add('Shougo/context_filetype.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/neosnippet', {
      \   'depends' : ["neosnippet-snippets"]
     \})

  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/neomru.vim')
  call dein#add('Shougo/neoyank.vim')

  call dein#add('scrooloose/nerdtree')
  call dein#add('bronson/vim-trailing-whitespace')

  " color theme
  call dein#add('w0ng/vim-hybrid')
  call dein#add('chriskempson/vim-tomorrow-theme')

  " lang plugins
  call dein#add('tpope/vim-rails')

  " 囲むやつ
  call dein#add('tpope/vim-surround')

  " コメントON/OFFを手軽に実行
  call dein#add('tomtom/tcomment_vim')

  " non blocking lint tool
  call dein#add('w0rp/ale')

  " coloring ansi code
  call dein#add('vim-scripts/AnsiEsc.vim')

  " test runner
  call dein#add('janko-m/vim-test')

  call dein#end()
  call dein#save_state()
endif

" plugins auto install
if has('vim_starting') && dein#check_install()
  call dein#install()
endif

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

set encoding=utf-8
set number
set clipboard=unnamed

if has("mac")
  "
  " macはunix=trueなので先に判定してやる
  "
elseif has("unix")
  set clipboard=unnamedplus
endif


set tabstop=2
set shiftwidth=2
set softtabstop=2
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
set wildignorecase

"検索関係
set ignorecase	" 大文字小文字を区別しない
set smartcase 	" 検索文字に大文字がある場合は大文字小文字を区別
set incsearch 	" インクリメンタルサーチ
set hlsearch
set wrapscan            " 検索時にファイルの最後まで行ったら最初に戻る

" ftplugin enable
filetype plugin on

" 折り返しの改行をよろしくやってくれる
set breakindent

" command modeのtab補完時に候補を表示
set wildmode=full
set wildmenu

hi MatchParen cterm=bold ctermbg=none ctermfg=blue

"補完
imap <C-@> <C-x><C-o>

" use login shell
set shell=zsh\ -l


"  ʕ◔ϖ◔ʔ
if $GOROOT != ''
  set rtp+=$GOROOT/misc/vim
endif

"=======================================================
" tcomment_vim / comment out shortcut
"------------------------------------------------------
"noremap <c-/><c-/>  :TComment<CR>

"" quickfix: 編集許可と折り返し表示無効
function! OpenModifiableQF()
        cw
        set modifiable
        set nowrap
endfunction

au QuickfixCmdPost vimgrep call OpenModifiableQF()

"=======================================================
" load plugin vimrcs
"------------------------------------------------------
if !has('nvim')
  runtime! vimrcs/*.vim
endif
