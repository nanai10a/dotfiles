local bind = function(from, to)
    vim.api.nvim_create_user_command(from, to, {})
end

local lspbind = function(from, to)
    bind(from, vim.lsp.buf[to])
end

local map = function(mode, from, to)
    vim.api.nvim_set_keymap(mode, from, "<cmd>" .. to .. "<cr>", { noremap = true })
end

local nimap = function(from, to)
    map("n", from, to)
    map("i", from, to)
end

-- mappings

lspbind("Hover", "hover") -- working
lspbind("CodeAction", "code_action") -- working: rust-analyzer: WTF HOLY SHIT
lspbind("References", "references") -- FIXME: rust_analyzer: -32602: Failed to deserialize textDocument/references: missing field `includeDeclaration`; {"position":{"line":19,"character":17},"textDocument":{"uri":"file:///home/nanai/playground/rust/60/src/lib.rs"},"context":{"range":0,"count":-1,"args":"","line1":1,"bang":false,"fargs":[],"reg":"","mods":"","line2":1}}
lspbind("Definition", "definition") -- working
lspbind("Implementation", "implementation") -- TODO: working...?
lspbind("Rename", "rename") -- FIXME: rust_analyzer: -32602: Failed to deserialize textDocument/rename: invalid type: map, expected a string; {"position":{"line":24,"character":8},"textDocument":{"uri":"file:///home/nanai/playground/rust/60/src/lib.rs"},"newName":{"bang":false,"fargs":[],"range":0,"mods":"","count":-1,"args":"","line1":1,"line2":1,"reg":""}}

nimap("<a-k>", "Hover")
nimap("<a-a>", "CodeAction")
nimap("<a-r>", "References")
nimap("<a-d>", "Definition")
nimap("<a-i>", "Implementation")
nimap("<a-n>", "Rename")

local lspcfg = require("lspconfig")

vim.g.markdown_fenced_languages = {
    "ts=typescript",
    "js=javascript",
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local cfgs = {}

-- filetype: arduino
-- install: <complex>
cfgs["arduino_language_server"] = nil

-- filetype: sh (bash)
-- install: `npm i -g bash-language-server`
cfgs["bashls"] = {}

-- filetype: c, cpp, objc, objcpp
-- install: `pacman -S clang`
-- working: maybe
cfgs["clangd"] = {}

-- filetype: cmake
-- install: `pip install cmake-language-server`
cfgs["cmake"] = {}

-- filetype: css, scss, less
-- install: `npm i -g vscode-langservers-extracted`
cfgs["cssls"] = {
    capabilities = capabilities,
}

-- filetype: javascript, javascriptreact, typescript, typescriptreact
-- install: `npm i -g cssmodules-language-server`
cfgs["cssmodules_ls"] = {}

-- filetype: dart
-- install: `pacman -S dart`
cfgs["dartls"] = {}

-- filetype: javascript, javascriptreact, javascript.jsx, typescript, typescriptreact, typescript.tsx (deno)
-- install: `pacman -S deno`
cfgs["denols"] = {
    init_options = {
        enable = true,
        lint = true,
        unstable = true,
    },
    root_dir = lspcfg.util.root_pattern("deno.json", "deno.jsonc"),
}

-- filetype: dockerfile
-- install: `npm i -g dockerfile-language-server-nodejs`
cfgs["dockerls"] = {}

-- filetype: javascript, javascriptreact, javascript.jsx, typescript, typescriptreact, typescript.tsx, vue
-- install: `npm i -g vscode-langservers-extracted`
cfgs["eslint"] = {
    -- FIXME: non-needed?
    capabilities = capabilities,
}

-- filetype: go, gomod, gotmpl
-- install: `go install golang.org/x/tools/gopls@latest`
-- working: maybe
cfgs["gopls"] = {}

-- filetype: haskell, lhaskell
-- install: `yay -S haskell-language-server-static`
cfgs["hls"] = {}

-- filetype: html
-- install: `npm i -g vscode-langservers-extracted`
cfgs["html"] = {
    capabilities = capabilities,
}

-- filetype: java
-- install : `yay -S jdtls`
--           `ln -s /usr/lib/jvm/default /usr/lib/jvm/temurin-11-jdk-amd64`
-- working: NO
cfgs["jdtls"] = {}

-- filetype: json, jsonc
-- install: `npm i -g vscode-langservers-extracted`
-- working: maybe
cfgs["jsonls"] = {
    capabilities = capabilities,
}

-- filetype: kotlin
-- install: `yay -S kotlin-language-server`
cfgs["kotlin_language_server"] = {}

-- filetype: bib, gitcommit, markdown, org, plaintex, rst, rnoweb, tex
-- install: <unknown>
-- FIXME: cfgs["ltex"] = {}

-- filetype: cs, vb
-- install: `yay -S omnisharp-roslyn`
-- working: maybe
cfgs["omnisharp"] = {
    cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
}

-- filetype: markdown
-- install: `cargo install prosemd-lsp`
-- working: NO?
-- cfgs["prosemd_lsp"] = {}

-- filetype: markdown
-- install: `npm i -g remark-language-server`
-- working: showing "install as locally": i don't want
-- cfgs["remark_ls"] = {}

-- filetype: rust
-- install: `rustup add component rls`
-- working: roughly
-- cfgs["rls"] = {}

-- filetype: rust
-- install: `rustup add component rust-analyzer-preview`
-- working: roughly
cfgs["rust_analyzer"] = {
    cmd = { "rustup", "run", "nightly", "rust-analyzer" },
    settings = {
        ["rust-analyzer"] = {
            procMacro = { enable = true },
            checkOnSave = { command = "clippy" },
        },
    },
}

-- filetype: lua
-- install: `pacman -S lua-language-server`
-- working: roughly
cfgs["sumneko_lua"] = {
    settings = {
        Lua = {
            runtime = {
                diagnotics = {
                    globals = { "vim" },
                },
            },
        },
    },
}

-- filetype: <many>
-- install: `npm i -g @tailwindcss/language-server`
-- working: maybe
cfgs["tailwindcss"] = {}

-- filetype: toml
-- install: `cargo install taplo-cli`
-- working: maybe
cfgs["taplo"] = {}

-- filetype: javascript, javascriptreact, javascript.jsx, typescript, typescriptreact, typescript.tsx
-- install: `npm i -g typescript{,-language-server}`
-- working: maybe
cfgs["tsserver"] = {}

-- filetype: vim
-- install: `npm i -g vim-language-server`
cfgs["vimls"] = {}

-- filetype: yaml, yaml.docker-compose
-- install: `npm i -g yaml-language-server`
cfgs["yamlls"] = {}

for k, v in pairs(cfgs) do
    local on_attach = v.on_attach
    v.on_attach = function()
        if on_attach then
            on_attach()
        end

        print("[c:dein/lsp] lsp '" .. k .. "' attached.")
    end

    lspcfg[k].setup(v)
end
