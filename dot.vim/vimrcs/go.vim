"=======================================================
" vim-go 
"------------------------------------------------------
au FileType go nmap [golang] <Nop>
au FileType go nmap <Space>g [golang]

au FileType go nmap [golang]r <Plug>(go-run)
au FileType go nmap [golang]b <Plug>(go-build)
au FileType go nmap [golang]t <Plug>(go-test)
au FileType go nmap [golang]c <Plug>(go-coverage)
