" let g:ale_fix_on_save = 1

" highlight clear ALEErrorSign
" highlight clear ALEWarningSign
" highlight clear ALEInfoSign
" highlight clear ALEStyleErrorSign
" highlight clear ALEStyleWarningSign
"
" highlight ALEErrorSign ctermbg=Yellow
" highlight ALEWarning ctermbg=Yellow
" highlight ALEInfoSign ctermbg=Yellow
" highlight ALEStyleErrorSign ctermbg=Yellow
" highlight ALEStyleWarningSign ctermbg=Yellow


let g:ale_sign_error = 'E'
let g:ale_sign_offset = 1000000
let g:ale_sign_warning = 'W'

let g:ale_completion_enabled = 1
let g:ale_set_highlights = 1

let g:ale_sign_column_always = 1

augroup ALEProgress
    autocmd!
    autocmd User ALELintPre  hi Statusline ctermfg=darkgrey
    autocmd User ALELintPost hi Statusline ctermfg=NONE
augroup END

let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}

"" Put this in vimrc or a plugin file of your own.
" After this is configured, :ALEFix will try and fix your JS code with ESLint.
let g:ale_fixers = {
\   'javascript': ['eslint', 'prettier'],
\   'typescript': ['eslint', 'prettier'],
\   'typescriptreact': ['eslint', 'prettier'],
\   'ruby': ['rubocop'],
\   'go': ['gofmt', 'goimports'],
\   'jsonnet': ['jsonnetfmt'],
\   'json': ['fixjson'],
\   'terraform': ['terraform'],
\   'rego': ['opafmt'],
\}

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\   'typescriptreact': ['eslint'],
\   'json': ['jsonlint'],
\   'jsonnet': ['jsonnet-lint'],
\   'yaml': ['yq validate'],
\   'sh': ['shellcheck'],
\   'markdown': ['textlint'],
\   'terraform': ['terraform', 'tflint', 'tfsec'],
\   'rego': ['opacheck'],
\}

" call ale#linter#Define('sh', {
" \   'name': 'shell',
" \   'output_stream': 'stderr',
" \   'executable': function('ale_linters#sh#shell#GetExecutable'),
" \   'command': function('ale_linters#sh#shell#GetCommand'),
" \   'callback': 'ale_linters#sh#shell#Handle',
" \})

" aliases
:command! Fa ALEFix
:command! Fl ALELint

