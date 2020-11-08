nnoremap <silent> <Leader>g :<C-u>silent call <SID>find_rip_grep()<CR>

function! s:find_rip_grep() abort
    call fzf#vim#grep(
                \   'rg --ignore-file ~/.ignore --column --line-number --no-heading --hidden --smart-case .+',
                \   1,
                \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%', '?'),
                \   0,
                \ )
endfunction

" 保存時にgo fmt
autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()

" 定義ジャンプ後にコールバックで呼ぶ関数
function! Language_client_definition_callback(output, ...) abort
    normal! zz
    call vista#util#Blink(3, 100)
endfunction

" ドキュメントのハイライトをトグルさせるための設定
let s:ls_is_highlighting_document = v:false
function! s:ls_toggle_document_highlight() abort
    if !s:ls_is_highlighting_document
        call LanguageClient#textDocument_documentHighlight()
        let s:ls_is_highlighting_document = v:true
    else
        call LanguageClient#clearDocumentHighlight()
        let s:ls_is_highlighting_document = v:false
    end
endfunction

" ドキュメントの表示をトグルさせるための設定
function! s:ls_toggle_document_hover() abort
    let hover_buf = s:ls_get_hover_buf()
    if hover_buf == 0
        call LanguageClient#textDocument_hover()
    else
        execute(printf('bwipe! %s', hover_buf))
    endif
endfunction

function! s:ls_get_hover_buf() abort
    for w in nvim_list_wins()
        let bufnum = nvim_win_get_buf(w)
        let bufname = bufname(bufnum)
        if bufname ==# '__LanguageClient__'
            return bufnum
        endif
    endfor

    return 0
endfunction

command! GoRename           call LanguageClient#textDocument_rename()
command! GoImports          ! goimports -w %
command! GoCodeAction       call LanguageClient#textDocument_codeAction()<CR>

" FIXME implement interface
" command! IMP call s:go_fzf_implement_interface()
" function! s:go_fzf_implement_interface() abort
"     let source = 'go_list_interfaces'
"
"     call fzf#run({
"                 \   'source': source,
"                 \   'sink':   function('s:go_implement_interface'),
"                 \   'down':   '40%'
"                 \ })
" endfunction
"
" function! s:go_implement_interface(interface) abort
"     call s:go_execute_impl(a:interface, v:false)
" endfunction
"
" function! s:go_receiver() abort
"   let receiveType = expand("<cword>")
"   if receiveType == "type"
"     normal! w
"     let receiveType = expand("<cword>")
"   elseif receiveType == "struct"
"     normal! ge
"     let receiveType = expand("<cword>")
"   endif
"   return printf("%s *%s", tolower(receiveType)[0], receiveType)
" endfunction
"
" function! s:go_execute_impl(interface, is_std_pkg) abort
"     let pos = getpos('.')
"     let recv = s:go_receiver()
"
"     " Make sure we put the generated code *after* the struct.
"     if getline('.') =~# 'struct '
"         normal! $%
"     endif
"
"     if !a:is_std_pkg
"         let pkg = system('go mod edit -json | jq -r .Module.Path | tr -d "\n"')
"         if a:interface =~# '^\.'
"             let interface = printf('%s%s', pkg, a:interface)
"         else
"             let interface = printf('%s/%s', pkg, a:interface)
"         endif
"     else
"         let interface = a:interface
"     end
"
"     try
"         let dirname = fnameescape(expand('%:p:h'))
"
"         " let [result, err] = go#util#Exec(['impl', '-dir', dirname, recv, interface])
"         let impl =  system('impl -dir ' . dirname . ' ' . recv . ' ' . interface)
"         let result = substitute(impl, "\n*$", '', '')
"         " if err
"         "     call go#util#EchoError(result)
"         "     return
"         " endif
"
"         if result is# ''
"             return
"         end
"
"         put =''
"         silent put =result
"     finally
"         call setpos('.', pos)
"     endtry
" endfunction

