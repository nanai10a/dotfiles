-- local color_suffixes = {
--     "8",
--     "9",
--     "A",
--     "B",
--     "C",
--     "D",
--     "E",
--     "F",
-- }
-- local colors = {}
-- local termcolors = {}
--
-- for _, s in ipairs(color_suffixes) do
--     local color = "#" .. vim.g["base16_gui0" .. s]
--     local termcolor = vim.g["base16_cterm0" .. s]
--     table.insert(colors, color)
--     table.insert(termcolors, termcolor)
-- end

require("nvim-treesitter.configs").setup({
    ensure_installed = "all",
    sync_install = false,
    highlight = {
        enable = true,
    },
    -- rainbow = {
    --     enable = true,
    --     extended_mode = true,
    --     max_file_lines = nil,
    --     colors = colors,
    --     termcolors = termcolors,
    -- },
})

require("nvim-ts-autotag").setup()
