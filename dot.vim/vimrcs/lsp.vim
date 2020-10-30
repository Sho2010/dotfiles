let g:LanguageClient_serverCommands = {
    \ 'go': ['gopls']
    \ }

let g:LanguageClient_applyCompletionAdditionalTextEdits = 1
let g:LanguageClient_autoStart                          = 1
let g:LanguageClient_autoStop                           = 1
let g:LanguageClient_changeThrottle                     = v:null
let g:LanguageClient_completionPreferTextEdit           = 0
let g:LanguageClient_diagnosticsEnable                  = 1
let g:LanguageClient_diagnosticsIgnoreSources           = ['go mod tidy']
let g:LanguageClient_diagnosticsList                    = 'Quickfix'
let g:LanguageClient_diagnosticsMaxSeverity             = 'Hint'
let g:LanguageClient_diagnosticsSignsMax                = v:null
let g:LanguageClient_echoProjectRoot                    = 0
let g:LanguageClient_floatingHoverHighlight             = 'Normal:Pmenu'
let g:LanguageClient_floatingWindowStyle                = 'minimal'
let g:LanguageClient_fzfContextMenu                     = 1
let g:LanguageClient_hideVirtualTextsOnInsert           = 1
let g:LanguageClient_hoverPreview                       = 'Always'
let g:LanguageClient_loadSettings                       = 1
let g:LanguageClient_preferredMarkupKind                = ['markdown', 'plaintext']
let g:LanguageClient_selectionUI                        = 'fzf'
let g:LanguageClient_selectionUI_autoOpen               = 0
let g:LanguageClient_settingsPath                       = "~/.config/nvim/settings.json"
" let g:LanguageClient_settingsPath                       = $HOME.'/.config/nvim/settings.json'
let g:LanguageClient_trace                              = 'off'
let g:LanguageClient_useFloatingHover                   = 1
let g:LanguageClient_usePopupHover                      = 1
let g:LanguageClient_useVirtualText                     = 'Diagnostics'
let g:LanguageClient_virtualTextPrefix                  = '>> '
let g:LanguageClient_waitOutputTimeout                  = 100
let g:LanguageClient_windowLogMessageLevel              = 'Warning'
" goのときはLSPの影響でちらついでいらつくので常に表示
let g:ale_sign_column_always                            = 1

if has_key(g:LanguageClient_serverCommands, &filetype)

    nnoremap <F2>     K         :call LanguageClient#textDocument_hover()<CR>
    nnoremap <silent> K         :call LanguageClient#textDocument_hover()<CR>

    nnoremap <silent> ga        :<C-u>GoCodeAction<CR>
    nnoremap <silent> gf        :<C-u>call LanguageClient#explainErrorAtPoint()<CR>
    nnoremap <silent> gr        :<C-u>call LanguageClient#textDocument_references()<CR>
    nnoremap <silent> grn       :<C-u>call LanguageClient#textDocument_rename()<CR>
    nnoremap <silent> gv        :<C-u>silent Vista finder fzf:lcn<CR>
    nnoremap <silent> gd        :<C-u>call LanguageClient#textDocument_definition({'handle': v:true}, function('Language_client_definition_callback'))<CR>
    nnoremap <silent><C-]>      :<C-u>call LanguageClient#textDocument_definition({'handle': v:true}, function('Language_client_definition_callback'))<CR>

    " TODO
    nnoremap <silent> gsi       :<C-u>silent call <SID>ls_toggle_document_highlight()<CR>
    nnoremap <silent> <Leader>i :<C-u>call <SID>ls_toggle_document_hover()<CR>
    nnoremap <silent> gi        :<C-u>call LanguageClient#textDocument_implementation()<CR>
    nnoremap <silent> ge        :<C-u>call LanguageClient#explainErrorAtPoint()<CR>
endif

