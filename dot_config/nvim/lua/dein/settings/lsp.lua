local nmap = function(from, to)
    vim.api.nvim_set_keymap("n", from, "<cmd>Lsp" .. to .. "<cr>", { noremap = true })
end

local imap = function(from, to)
    vim.api.nvim_set_keymap("i", from, "<cmd>Lsp" .. to .. "<cr>", { noremap = true })
end

local nimap = function(from, to)
    nmap(from, to)
    imap(from, to)
end

-- mappings

-- alternative: neoformat
-- nimap("<a-f>", "DocumentFormat")
nimap("<a-k>", "Hover")
nimap("<a-r>", "References")
nimap("<a-d>", "Definition")
nimap("<a-n>", "Rename")
nimap("<a-P>", "PreviousDiagnostic")
nimap("<a-N>", "NextDiagnostic")
-- unused
-- nimap("<a-s>", "SignatureHelp")

-- settings

local ls = {}

-- settings: rls

local rlswc = {}

rlswc.rust = {
    clippy_preference = "on",
}

ls["rls"] = {
    workspace_config = rlswc,
    disabled = true,
}

-- settings: rust-analyzer

local rawc = {}

rawc["rust-analyzer"] = {
    checkOnSave = {
        command = "clippy",
    },
}

ls["rust-analyzer"] = {
    workspace_config = rawc,
}

-- settings: (apply)

vim.g.lsp_settings = ls
