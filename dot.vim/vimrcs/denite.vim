nnoremap [denite] <Nop>
nmap <Space>u [denite]

" nnoremap <silent> [unite]c   :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>

au FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>    denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d       denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p       denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q       denite#do_map('quit')
  nnoremap <silent><buffer><expr> i       denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'
endfunction

au FileType denite-filter call s:denite_filter_my_setting()
function! s:denite_filter_my_setting() abort
  nnoremap <silent><buffer><expr> i       denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> q       denite#do_map('quit')
endfunction

" call denite#custom#source('file_mru', 'matchers', ['matcher/fuzzy', 'matcher/project_files'])
noremap [denite]u :<C-u>Denite buffer file_mru<CR>
noremap [denite]c :<C-u>Denite command_history <CR>

let s:denite_options = {
      \ 'prompt' : '>',
      \ 'split': 'floating',
      \ 'start-filter': v:true,
      \ 'auto-resize': v:true,
      \ 'source-names': 'short',
      \ 'direction': 'botright',
      \ 'highlight_filter_background': 'CursorLine',
      \ 'highlight_matched_char': 'Type',
      \ }
call denite#custom#option('default', s:denite_options)
