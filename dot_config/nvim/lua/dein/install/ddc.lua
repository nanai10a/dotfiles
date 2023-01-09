-- base plugin
vim.fn["dein#add"]("Shougo/ddc.vim")

-- extension plugins (ui)
vim.fn["dein#add"]("Shougo/ddc-ui-pum")

-- extension plugins (filter)
vim.fn["dein#add"]("tani/ddc-fuzzy")

-- extension plugins (source)
vim.fn["dein#add"]("Shougo/ddc-source-around")
vim.fn["dein#add"]("Shougo/ddc-source-nvim-lsp")
-- vim.fn["dein#add"]("LumaKernel/ddc-source-file") -- FIXME: unnecessary?
-- vim.fn["dein#add"]("Shougo/ddc-source-cmdline")  -- FIXME: unnecessary?
