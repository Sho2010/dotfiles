let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}

"" Put this in vimrc or a plugin file of your own.
" After this is configured, :ALEFix will try and fix your JS code with ESLint.
let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'ruby': ['rubocop'],
\   'go': ['gofmt', 'goimports'],
\   'json': ['fixjson']
\}

let g:ale_linters = {
\   'json': ['jsonlint'],
\   'yaml': ['yq validate'],
\   'sh': ['shellcheck'],
\   'markdown': ['textlint']
\}

" call ale#linter#Define('sh', {
" \   'name': 'shell',
" \   'output_stream': 'stderr',
" \   'executable': function('ale_linters#sh#shell#GetExecutable'),
" \   'command': function('ale_linters#sh#shell#GetCommand'),
" \   'callback': 'ale_linters#sh#shell#Handle',
" \})

" let g:ale_fix_on_save = 1
let g:ale_sign_error = 'E'
let g:ale_sign_offset = 1000000
let g:ale_sign_warning = 'W'

let g:ale_completion_enabled = 1

" aliases
:command! Fa ALEFix
:command! Fl ALELint


