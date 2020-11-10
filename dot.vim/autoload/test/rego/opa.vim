if !exists('g:test#rego#opa#patterns')
  let g:test#rego#opa#patterns = {
    \ 'test':      ['\v^\s*test_(\w+)'],
    \ 'namespace': [],
  \}
endif

if !exists('g:test#rego#opa#file_pattern')
  let g:test#rego#opa#file_pattern = '\v[^_].*_test\.rego$'
endif

function! test#rego#opa#test_file(file) abort
  return fnamemodify(a:file, ':t') =~# g:test#rego#opa#file_pattern
endfunction

function! test#rego#opa#build_position(type, position) abort
  let policy_dir = fnamemodify(a:position['file'], ':p:h')
  let filename = fnamemodify(a:position['file'], ':s?_test??')

  if a:type ==# 'suite'
    return [policy_dir]
  elseif a:type ==# 'file'
    return [a:position['file'], filename]
  elseif a:type ==# 'nearest'
    let name = s:nearest_test(a:position)
    return [a:position['file'], filename, ' -r ' . name]
  endif
endfunction

function! test#rego#opa#build_args(args) abort
  return a:args
endfunction

function! test#rego#opa#executable() abort
  return 'opa test -v'
endfunction

function! s:nearest_test(position) abort
  let name = test#base#nearest_test(a:position, g:test#rego#opa#patterns)
  return join(name['test'])
endfunction
