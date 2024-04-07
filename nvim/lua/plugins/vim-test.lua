-- このまま使うと検索時の 'n' でNextが使えなくなるのでDisabled
return {
  'janko-m/vim-test',
  enabled = false,
  cond = not (vim.g.vscode == 1),
  keys = {
    { 'n', '[test]', '<Nop>', { silent = true, noremap = true, desc = "Group leader for test commands" } },
    { 'n', ' t', '[test]', { noremap = true, silent = true } },
    { 'n', '[test]t', ':TestNearest<CR>', { noremap = true, silent = true } },
    { 'n', '[test]n', ':TestNearest<CR>', { noremap = true, silent = true } },
    { 'n', '[test]f', ':TestFile<CR>', { noremap = true, silent = true } },
    { 'n', '[test]s', ':TestSuite<CR>', { noremap = true, silent = true } },
    { 'n', '[test]l', ':TestLast<CR>', { noremap = true, silent = true } },
    { 'n', '[test]v', ':TestVisit<CR>', { noremap = true, silent = true } },
  },
  config = function()
    -- Set global variables for the vim-test plugin
    vim.g['test#strategy'] = "dispatch"
    vim.g['test#go#runner'] = 'gotest'
  end
}

