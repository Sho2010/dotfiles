call deoplete#custom#option('enable_at_startup', 1)
call deoplete#custom#option('auto_complete_delay', 0)
call deoplete#custom#option('auto_complete_start_length', 2)
call deoplete#custom#option('enable_camel_case', 0)
call deoplete#custom#option('enable_ignore_case', 0)
call deoplete#custom#option('enable_refresh_always', 0)
call deoplete#custom#option('enable_smart_case', 1)
call deoplete#custom#option('max_list', 100)
call deoplete#custom#var('file', 'enable_buffer_path', v:true)

let g:deoplete#sources = {}
let g:deoplete#sources._=['omni', 'buffer', 'member', 'tag', 'ultisnips', 'file']

let g:deoplete#complete_method = "omnifunc"

" Sample configuration for dictionary source with multiple
" dictionary files.
setlocal dictionary+=~/.vim/dict/common.dict

" Remove this if you'd like to use fuzzy search
call deoplete#custom#source('dictionary', 'matchers', ['matcher_head'])
"
" If dictionary is already sorted, no need to sort it again.
call deoplete#custom#source('dictionary', 'sorters', [])

" Do not complete too short words
call deoplete#custom#source('dictionary', 'min_pattern_length', 2)

