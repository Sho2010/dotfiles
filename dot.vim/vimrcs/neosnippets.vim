let g:neosnippet#snippets_directory='~/.vim/snippets/'

" ~/.vim/snippets/model.rails.snip
autocmd BufEnter * if exists("b:rails_root") | NeoSnippetSource ~/.vim/snippets/rails.snip | endif
" autocmd BufEnter * if exists("b:rails_root") | :NeoCompleteSetFileType ruby.rails | endif
" autocmd BufEnter * if (expand("%") =~ "_spec\.rb$") || (expand("%") =~ "^spec.*\.rb$") | NeoCompleteSetFileType ruby.rspec | endif

"
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

