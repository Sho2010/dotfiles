vim.cmd('runtime! syntax/yaml.vim')
vim.b.current_syntax = nil
vim.bo.dictionary = vim.bo.dictionary .. ',' .. vim.fn.stdpath('config') .. '/dict/kustomize.dict'
