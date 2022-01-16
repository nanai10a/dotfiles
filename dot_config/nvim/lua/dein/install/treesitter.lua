-- base plugin
vim.fn["dein#add"]("nvim-treesitter/nvim-treesitter")

-- extension plugins
vim.fn["dein#add"]("windwp/nvim-ts-autotag")
-- disabled `nvim-ts-rainbow`: *not good* and maybe too late (> 900ms !?)
-- vim.fn["dein#add"]("p00f/nvim-ts-rainbow")
