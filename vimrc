set incsearch
set hlsearch
set ic
set tabstop=2
set expandtab
set shiftwidth=2

filetype plugin indent on
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab


" Indent line plugin 
let g:indentLine_char = '⦙'

"ALE plugin
"
"donot run syntax highlighter on opening a file
let g:ale_lint_on_enter = 0

"run it on saving a file
let g:ale_lint_on_save = 1

"making it pretty 
"let g:ale_sign_error = '●'
"let g:ale_sign_warning = '.'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 'never'

"count no of syntax errors
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? 'OK' : printf(
        \   '%d⨉ %d⚠ ',
        \   all_non_errors,
        \   all_errors
        \)
endfunction
set statusline+=%=
set statusline+=\ %{LinterStatus()}

nmap <silent> <C-e> <Plug>(ale_next_wrap)

