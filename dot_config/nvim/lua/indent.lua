vim.o.shiftwidth = 4

vim.cmd("au BufRead,BufNewFile *.scss set filetype=scss.css")
vim.cmd("au BufRead,BufNewFile *.{js,jsx,ts,tsx,css,scss} set shiftwidth=2")
