return {
  'scrooloose/nerdtree',
  cond = not (vim.g.vscode == 1),
  keys = {
    { "<Leader>n", ":NERDTreeFind<Enter>", { silent = true, noremap = true, desc = "" } },
  },
  config = function()
    -- ファイルを開いたときにNERDTreeを閉じる
    vim.g.NERDTreeQuitOnOpen = 1
  end
}
