local lprint = function(s) print("[c:lua/dein] " .. s) end

local dir = vim.env.HOME .. "/.config/nvim/.dein"
local repo_dir = dir .. "/repos/github.com/Shougo/dein.vim"

if not string.match(vim.o.runtimepath, "/dein.vim") then
    if vim.fn.isdirectory(repo_dir) ~= 1 then
        lprint("dein.vim not installed, installing...")
        os.execute("git clone https://github.com/Shougo/dein.vim" .. " " .. repo_dir)
        lprint("dein.vim installed.")
    end
    vim.o.runtimepath = vim.o.runtimepath .. "," ..  repo_dir
end

if vim.fn["dein#load_state"](dir) == 1 then
    vim.fn["dein#begin"](dir)

    utils.dodirs("lua/dein/install")

    vim.fn["dein#end"]()

    if vim.fn["dein#check_install"]() ~= 0 then
        lprint("installing plugins...")
        vim.fn["dein#install"]()
        lprint("plugins installed.")
    end

    if table.maxn(vim.fn["dein#check_clean"]()) >= 1 then
        -- TODO: delete unused plugins
    end

    utils.dodirs("lua/dein/settings")
end

lprint("configuration completed.")
