let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 0
let g:deoplete#auto_complete_start_length = 2
let g:deoplete#enable_camel_case = 0
let g:deoplete#enable_ignore_case = 0
let g:deoplete#enable_refresh_always = 0
let g:deoplete#enable_smart_case = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#max_list = 100

" let g:deoplete#sources = {}
" let g:deoplete#sources._=['omni', 'buffer', 'member', 'tag', 'ultisnips', 'file']

" Sample configuration for dictionary source with multiple
" dictionary files.
" setlocal dictionary+=~/.vim/dict/ruby.dict
" setlocal dictionary+=~/.vim/dict/kustomize.dict
"
" Remove this if you'd like to use fuzzy search
call deoplete#custom#source('dictionary', 'matchers', ['matcher_head'])
"
" If dictionary is already sorted, no need to sort it again.
call deoplete#custom#source('dictionary', 'sorters', [])
" Do not complete too short words
call deoplete#custom#source('dictionary', 'min_pattern_length', 2)

