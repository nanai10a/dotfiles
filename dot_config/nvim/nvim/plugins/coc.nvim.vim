set hidden
set updatetime=300
" set shortmess += c

inoremap <expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#reflesh()

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nnoremap <space><space> :<C-u>CocList<CR>
nnoremap <space>h :<C-u>call CocAction("doHover")<CR>
nnoremap <space>df :<C-u>call CocActionAsync("jumpDefinition")<CR>
nnoremap <space>tdf <Plug>(coc-type-definition)
nnoremap <space>rf :<C-u>call CocActionAsync("jumpReferences")<CR>
nnoremap <space>rn :<C-u>call CocActionAsync("rename")<CR>
nnoremap <space>fmt :<C-u>call CocActionAsync("format")<CR>

autocmd CursorHold * silent call CocActionAsync('highlight')
