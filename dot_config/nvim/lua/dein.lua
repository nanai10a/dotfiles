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

vim.g["dein#install_github_api_token"] = ENV.GITHUB_TOKEN

if vim.fn["dein#load_state"](dir) == 1 then
    vim.fn["dein#begin"](dir)

    utils.dodirs("lua/dein/install")

    vim.fn["dein#end"]()

    if vim.fn["dein#check_install"]() ~= 0 then
        lprint("installing plugins...")
        vim.fn["dein#install"]()
        lprint("plugins installed.")
    end

    -- FIXME: too late! (using **400**ms)
    -- if vim.fn["dein#check_update"]() == 1 then
    --     lprint("updating plugins...")
    --     vim.fn["dein#update"]()
    --     lprint("plugins updated.")
    -- end

    if table.maxn(vim.fn["dein#check_clean"]()) >= 1 then
        -- TODO: delete unused plugins
    end

    utils.dodirs("lua/dein/settings")
end

lprint("configuration completed.")
