-- utilities...

lfs = require("lfs")

utils = {}

utils.configdir = vim.env.HOME .. "/.config/nvim"

utils.dofile = function(path)
    dofile(utils.configdir .. "/" .. path)
end

utils.dodirs = function(path)
    local dir = utils.configdir .. "/" .. path
    for f in lfs.dir(dir) do
        if string.match(f, ".+%.lua") ~= nil then
            dofile(dir .. "/" .. f)
        end
    end
end

-- ...end

-- environment variables
utils.dofile(".env.lua")

utils.dodirs("lua")
