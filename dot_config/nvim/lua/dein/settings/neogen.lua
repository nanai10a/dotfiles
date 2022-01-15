require("neogen").setup({
    enabled = true,
})

vim.api.nvim_set_keymap("n", "<a-D>", "<cmd>Neogen<cr>", { noremap = true, })
