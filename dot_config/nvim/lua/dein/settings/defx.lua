local map = function(mode, from, to)
    vim.api.nvim_buf_set_keymap(0, mode, from, to, {
        noremap = true, silent = true
    })
end

local emap = function(mode, from, to)
    vim.api.nvim_buf_set_keymap(0, mode, from, to, {
        noremap = true, silent = true, expr = true
    })
end

local defxmap = function(mode, from, action, ...)
    local to = "defx#do_action('" .. action .. "'"
    for _, a in pairs({ ... }) do
        to = to .. ", " .. a
    end
    to = to .. ")"

    emap(mode, from, to)
end

-- bases

_G.defx_settings = function()
    map("n", "<space>", "")
    map("n", "h", "")
    map("n", "l", "")

    defxmap("n", "<cr>", "drop")
    defxmap("n", "<bs>", "cd", "'..'")

    defxmap("n", "O", "open")
    defxmap("n", "t", "open_tree", "'toggle'")
    defxmap("n", "P", "preview")

    defxmap("n", "N", "new_file")
    defxmap("n", "rn", "rename", "'insert'")
    defxmap("n", "RN", "rename", "'new'")
    defxmap("n", "RM", "remove_trash")

    defxmap("v", "y", "copy")
    defxmap("v", "d", "move")
    defxmap("n", "<c-p>", "paste")
    defxmap("n", "<c-[>", "clear_clipboard")

    defxmap("n", "<c-i>", "toggle_ignored_files")
    defxmap("n", "r", "redraw")
    defxmap("n", "e", "execute_command")
    defxmap("n", "E", "execute_system")
end

vim.cmd("autocmd FileType defx call v:lua.defx_settings()")

_G.defx_replace = function(path)
    if vim.api.nvim_eval("bufnr('%') != expand('<abuf>')") == 1 then
        return
    end

    vim.cmd([[
    augroup FileExplorer
        autocmd!
    augroup END
    ]])

    vim.cmd("Defx -buffer-name='defx' -columns=indent:icons:space:git:space:filename:space:type " .. path)
    vim.cmd("vertical resize 35")

    return 0
end

vim.cmd([[
autocmd BufEnter,VimEnter,BufNew,BufWinEnter,BufRead,BufCreate
    \ * if isdirectory(expand("<amatch>"))
    \   | call v:lua.defx_replace(expand("<amatch>")) | endif
]])

-- extensions

vim.fn["defx#custom#column"]("git", "indicators", {
  Modified = "e",
  Staged = "+",
  Untracked = "*",
  Renamed = "r",
  Unmerged = "m",
  Ignored = "i",
  Deleted = "x",
  Unknown = "?"
})
