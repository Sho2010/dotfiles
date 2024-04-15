vim.keymap.set('i', '<C-k>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false
})
