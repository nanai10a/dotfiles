vim.o.laststatus = 2
vim.o.showmode = false

-- FIXME: can't fix strange spaces on messages of first line
require("lualine").setup({
    theme = "base16"
})
