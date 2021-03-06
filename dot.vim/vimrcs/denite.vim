nnoremap [denite] <Nop>
nmap <Space>u [denite]

noremap [denite]u :<C-u>Denite buffer file_mru<CR>
noremap [denite]u :<C-u>Denite file_mru<CR>
noremap [denite]c :<C-u>Denite command_history<CR>
noremap [denite]y :<C-u>Denite neoyank<CR>
noremap [denite]r :<C-u>Denite register<CR>
noremap [denite]f :<C-u>Denite file/rec<CR>

" <left>を使ってる理由は<C-h> だと入力値が消えちゃう...
noremap [denite]g :<C-u>Denite git-grep::-i<Left><Left><Left>

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
  call deoplete#custom#buffer_option('auto_complete', v:false)
endfunction


" file_mru はあいまい検索しない
call denite#custom#source('file_mru', 'matchers', ['matcher/substring'])

:call denite#custom#option('default', 'start-filter', 'v:true')

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
