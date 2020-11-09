" Copy from https://github.com/fatih/vim-go/blob/master/autoload/go/alternate.vim

" don't spam the user when Vim is started in Vi compatibility mode
let s:cpo_save = &cpo
set cpo&vim

" Test alternates between the implementation of code and the test code.
function! go_alternate#Switch(bang, cmd) abort
  let file = expand('%')
  if empty(file)
    echo("no buffer name")
    return
  elseif file =~# '^\f\+_test\.go$'
    let l:root = split(file, '_test.go$')[0]
    let l:alt_file = l:root . ".go"
  elseif file =~# '^\f\+\.go$'
    let l:root = split(file, ".go$")[0]
    let l:alt_file = l:root . '_test.go'
  else
    echo("not a go file")
    return
  endif
  if !filereadable(alt_file) && !bufexists(alt_file) && !a:bang
    echo("couldn't find ".alt_file)
    return
  elseif empty(a:cmd)
    " execute ":" . go#config#AlternateMode() . " " . alt_file
    execute ":" . "edit" . " " . alt_file
  else
    execute ":" . a:cmd . " " . alt_file
  endif
endfunction

command! GoAlt           call go_alternate#Switch(<bang>0, 'edit')
nnoremap <silent> <Leader>a :GoAlt<CR>

" command! -bang A  call go#alternate#Switch(<bang>0, 'edit')
" command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
" command! -bang AS call go#alternate#Switch(<bang>0, 'split')
" command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

" restore Vi compatibility settings
let &cpo = s:cpo_save
unlet s:cpo_save

