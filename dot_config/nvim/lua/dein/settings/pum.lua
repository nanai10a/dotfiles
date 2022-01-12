-- mappings
local map = function(from, to)
        vim.api.nvim_set_keymap("i", from, "pum#map#" .. to, { noremap = true, expr = true })
end

-- alternative of <tab>
-- vim.api.nvim_set_keymap("i", "<c-space>", "<tab>", { noremap = true })

-- map("<tab>", "insert_relative(+1)")
-- map("<s-tab>", "insert_relative(-1)")

map("<c-n>", "insert_relative(+1)")
map("<c-p>", "insert_relative(-1)")

map("<pagedown>", "insert_relative(+1)")
map("<pageup>", "insert_relative(-1)")

map("<c-y>", "confirm()")
map("<c-e>", "cancel()")
