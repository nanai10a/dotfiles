-- base plugin
vim.fn["dein#add"]("nvim-treesitter/nvim-treesitter", { hook_post_update = "TSUpdate" })

-- extension plugins
vim.fn["dein#add"]("windwp/nvim-ts-autotag")
