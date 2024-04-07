lua require('core')

if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" |endif
endif

command -nargs=0 A :CocCommand clangd.switchSourceHeader
