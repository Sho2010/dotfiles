-- vscode上で動かしても問題がなく特に設定がいらないプラグイン
return {
  -- color schemes
  "w0ng/vim-hybrid",
  "chriskempson/vim-tomorrow-theme",

  -- utilities
  "tpope/vim-surround",              -- 囲むやつ
  "bronson/vim-trailing-whitespace", -- 行末の空白を表示
  "vim-scripts/AnsiEsc.vim",         -- coloring ansi code
  { "windwp/nvim-autopairs",event = 'InsertEnter' } -- 括弧を勝手に閉じるやつ
  -- "mattn/vim-findroot",
}

