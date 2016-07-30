"rubocop
let g:syntastic_mode_map = { 'mode': 'passive',
            \ 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']

"go lang
let g:syntastic_mode_map = { 'mode': 'passive',
    \ 'active_filetypes': ['go'] }
let g:syntastic_go_checkers = ['go', 'golint']
