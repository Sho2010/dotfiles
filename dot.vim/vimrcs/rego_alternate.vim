" don't spam the user when Vim is started in Vi compatibility mode
let s:cpo_save = &cpo
set cpo&vim

" Test alternates between the implementation of code and the test code.
function! rego_alternate#Switch(bang, cmd) abort
  let file = expand('%')
  if empty(file)
    echo("no buffer name")
    return
  elseif file =~# '^\f\+_test\.rego$'
    let l:root = split(file, '_test.rego$')[0]
    let l:alt_file = l:root . ".rego"
  elseif file =~# '^\f\+\.rego$'
    let l:root = split(file, ".rego$")[0]
    let l:alt_file = l:root . '_test.rego'
  else
    echo("not a rego file")
    return
  endif
  if !filereadable(alt_file) && !bufexists(alt_file) && !a:bang
    echo("couldn't find ".alt_file)
    return
  elseif empty(a:cmd)
    execute ":" . "edit" . " " . alt_file
  else
    execute ":" . a:cmd . " " . alt_file
  endif
endfunction

command! RegoAlt           call rego_alternate#Switch(<bang>0, 'edit')
nnoremap <silent> <Leader>a :RegoAlt<CR>

" restore Vi compatibility settings
let &cpo = s:cpo_save
unlet s:cpo_save

