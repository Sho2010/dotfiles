return {
  'scrooloose/nerdtree',
  enabled = true,
  cond = not (vim.g.vscode == 1),
  lazy = false,
  keys = {
    { "<Leader>n", ":NERDTreeFind<CR>", { silent = true, noremap = true, desc = "" } },
  },
  config = function()
    -- ファイルを開いたときにNERDTreeを閉じる
    vim.g.NERDTreeQuitOnOpen = 1
  end
}
