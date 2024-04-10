-- 設定ガイド
-- set mapleader='/<Space>' --Vim scriptの場合はエスケープ処理と文字コードが必要。
-- vim.g.mapleader = ' ' --この設定は構文が異なりエスケープ処理も文字コードも不要。

-- set clipboard+=unnamedplus --Vim script
-- vim.opt.clipboard:append{'unnamedplus'} --特別な指定方法の一つ。
-- 
-- set list listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:% --Vim script
-- vim.opt.listchars = {tab='»-', trail='-', eol='↲', extends='»', precedes='«', nbsp='%'} --特別な指定方法の一つ。
-- 
-- set shortmess+=I --Vim script
-- vim.cmd('set shortmess+=I') --代替しうる構文が見つからない時はvim.cmdを利用してVim scriptで書く。
-- 
-- set noundofile --Vim script
-- vim.opt.undofile = false --init.luaに否定形の構文はないため、この場合は指定すべき真偽値が逆になることに注意されたし。
--

vim.opt.encoding = "utf-8"
vim.opt.number = true
vim.opt.clipboard = "unnamed"

-- if has("mac")
--   -- "
--   -- " macはunix=trueなので先に判定してやる
--   -- "
-- elseif has("unix")
--   set clipboard=unnamedplus
-- endif
--

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.autoindent =true
vim.opt.expandtab = true

-- "バックスペースで改行とかも消せる"
vim.opt.backspace = 'indent,eol,start'
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- "backup,swap fileいらない
vim.opt.writebackup = false
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.hidden = true

vim.opt.wildignorecase = true
vim.opt.wildignore = ".git,.svn,*.pyc,*.o,*.out,*.zip,*.DS_Store,**/node_modules/**,**/bower_modules/**"

-- "検索関係
vim.opt.ignorecase = true  -- " 大文字小文字を区別しない
vim.opt.smartcase  = true  -- " 検索文字に大文字がある場合は大文字小文字を区別
vim.opt.incsearch  = true  -- " インクリメンタルサーチ
vim.opt.hlsearch   = true  --
vim.opt.wrapscan   = true  -- " 検索時にファイルの最後まで行ったら最初に戻る

-- colorscheme = 'hybrid'
vim.cmd("colorscheme hybrid")

-- undoの永続化
vim.opt.undodir = vim.fn.stdpath("state")
vim.opt.undofile = true

-- r, rr などの連続キーの待ち時間
vim.opt.timeout = true
vim.opt.timeoutlen = 300
