vim.o.shiftwidth = 4

vim.cmd("au BufRead,BufNewFile *.scss set filetype=scss.css")
vim.cmd("au BufRead,BufNewFile *.{js,jsx,ts,tsx,css,scss,json,yaml,html} set shiftwidth=2")
