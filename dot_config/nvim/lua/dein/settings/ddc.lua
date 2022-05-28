-- maps
vim.api.nvim_set_keymap(
    "i",
    "<tab>",
    [[ddc#map#pum_visible() ? '<c-n>' : (col('.') <= 1 <bar><bar> getline('.')[col('.') - 2] =~# '\s') ? '<tab>' : ddc#map#manual_complete()]],
    { silent = true, expr = true }
)

vim.api.nvim_set_keymap("i", "<s-tab>", "ddc#map#pum_visible() ? '<c-p>' : '<c-h>'", { silent = true, expr = true })

-- setting vars
local ss = {}
local so = {}
local sp = {}
local fp = {}

-- ddc-around
table.insert(ss, "around")
so.around = { mark = "around" }
sp.around = { maxSize = 500 }

-- ddc-fuzzy
so._ = {
    matchers = { "matcher_fuzzy" },
    sorters = { "sorter_fuzzy" },
    converters = { "converter_fuzzy" },
}
fp.converter_fuzzy = {
    hlGroup = "SpellBad",
}

-- ddc-file
table.insert(ss, "file")
so.file = {
    mark = "file",
    isVolatile = true,
    forceCompletionPattern = [[\\S*/\\S*]],
}

-- ddc-cmdline
table.insert(ss, "cmdline")
so.cmdline = { mark = "cmd" }

-- ddc-nvim-lsp
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
    completionMenu = "pum.vim",
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
