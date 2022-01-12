" "coc is save the world."
" see ":help coc-nvim".
call dein#add("neoclide/coc.nvim", { "merged" : 0, "rev" : "master", "build" : "yarn install --frozen-lockfile", "lazy": 1 })

" code snippet runner like a REPL and other.
" see ":help sniprun".
call dein#add("michaelb/sniprun", { "build" : "bash install.sh" })

" provided code
" show changed file lines. (from versioning tools)
if has("nvim") || has("patch-8.0.902")
   call dein#add("mhinz/vim-signify")
else
  call dein#add("mhinz/vim-signify", { "rev": "legacy" })
endif
