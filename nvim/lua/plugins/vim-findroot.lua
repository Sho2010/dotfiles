return {
  'mattn/vim-findroot',
  enabled = true,
  cond = not (vim.g.vscode == 1),
  config = function()
    -- ...
  end
}
