-- " highlight clear ALEErrorSign
-- " highlight clear ALEWarningSign
-- " highlight clear ALEInfoSign
-- " highlight clear ALEStyleErrorSign
-- " highlight clear ALEStyleWarningSign
-- "
-- " highlight ALEErrorSign ctermbg=Yellow
-- " highlight ALEWarning ctermbg=Yellow
-- " highlight ALEInfoSign ctermbg=Yellow
-- " highlight ALEStyleErrorSign ctermbg=Yellow
-- " highlight ALEStyleWarningSign ctermbg=Yellow

return {
  'w0rp/ale',
  enabled = true,
  cond = not (vim.g.vscode == 1),
  config = function()
    vim.g.ale_fix_on_save = 1
    vim.g.ale_sign_error = 'E'
    vim.g.ale_sign_offset = 1000000
    vim.g.ale_sign_warning = 'W'

    vim.g.ale_completion_enabled = 1
    vim.g.ale_set_highlights = 1
    vim.g.ale_sign_column_always = 1

    vim.g.ale_linter_aliases = { vue = { 'vue', 'javascript' } }

    vim.g.ale_fixers = {
      javascript = {'eslint', 'prettier'},
      typescript = {'eslint', 'prettier'},
      typescriptreact = {'eslint', 'prettier'},
      ruby = {'rubocop'},
      go = {'gofmt', 'goimports'},
      jsonnet = {'jsonnetfmt'},
      json = {'fixjson'},
      terraform = {'terraform'},
      rego = {'opafmt'},
    }

    vim.g.ale_linters = {
      javascript = {'eslint'},
      typescript = {'eslint'},
      typescriptreact = {'eslint'},
      json = {'jsonlint'},
      jsonnet = {'jsonnet-lint'},
      yaml = {'yq validate'},
      sh = {'shellcheck'},
      markdown = {'textlint'},
      terraform = {'terraform', 'tflint', 'tfsec'},
      rego = {'opacheck'},
      rust = {'analyzer'}
    }

    vim.api.nvim_command('command! Fa ALEFix')
    vim.api.nvim_command('command! Fl ALELint')

  end
}


-- TODO
-- vim.cmd('let g:vsnip_filetypes = {}')
-- augroup ALEProgress
--     autocmd!
--     autocmd User ALELintPre  hi Statusline ctermfg=darkgrey
--     autocmd User ALELintPost hi Statusline ctermfg=NONE
-- augroup END
-- 
-- 
--
-- " call ale#linter#Define('sh', {
-- " \   'name': 'shell',
-- " \   'output_stream': 'stderr',
-- " \   'executable': function('ale_linters#sh#shell#GetExecutable'),
-- " \   'command': function('ale_linters#sh#shell#GetCommand'),
-- " \   'callback': 'ale_linters#sh#shell#Handle',
-- " \})
--
