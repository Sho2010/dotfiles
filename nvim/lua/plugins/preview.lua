return {
  'previm/previm',
  enabled = true,
  cond = not (vim.g.vscode == 1),
  config = function()
    vim.g.previm_open_cmd = "open"
  end
}

