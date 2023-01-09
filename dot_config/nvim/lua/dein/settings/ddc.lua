-- maps
vim.api.nvim_set_keymap(
    "i",
    "<tab>",
    [[pum#visible() ? '<c-n>' : (col('.') <= 1 <bar><bar> getline('.')[col('.') - 2] =~# '\s') ? '<tab>' : ddc#map#manual_complete()]],
    { silent = true, expr = true }
)

vim.api.nvim_set_keymap("i", "<s-tab>", "pum#visible() ? '<c-p>' : '<s-tab>'", { silent = true, expr = true })

-- setting vars
local ss = {}
local so = {}
local sp = {}
local fp = {}

-- ddc-source-around
table.insert(ss, "around")
so["around"] = {
    mark = "around",
}
sp["around"] = {
    maxSize = 1000,
}

-- ddc-fuzzy
so["_"] = {
    matchers = { "matcher_fuzzy" },
    sorters = { "sorter_fuzzy" },
    converters = { "converter_fuzzy" },
}
fp["converter_fuzzy"] = {
    hlGroup = "SpellBad",
}

-- -- ddc-source-file
-- table.insert(ss, "file")
-- so.file = {
--     mark = "file",
--     isVolatile = true,
--     forceCompletionPattern = [[\\S*/\\S*]],
-- }

-- -- ddc-source-cmdline
-- table.insert(ss, "cmdline")
-- so.cmdline = { mark = "cmd" }

-- ddc-source-nvim-lsp
table.insert(ss, "nvim-lsp")
so["nvim-lsp"] = {
    mark = "lsp",
    matchers = { "matcher_fuzzy" },
 -- forceCompletionPattern = [[\.|:|->|"\w+/*]],
    forceCompletionPattern = [[\.\w*|:\w*|->\w*]],
    dup = true,
    timeout = 10000,
}

-- apply settings for ddc.vim
vim.fn["ddc#custom#patch_global"]({
    ui = "pum",
    backspaceCompletion = true,
    filterParams = fp,
    sources = ss,
    sourceOptions = so,
    sourceParams = sp,
})

-- languages settings
local ft = vim.fn["ddc#custom#patch_filetype"]

-- enable plugin
vim.fn["ddc#enable"]()
