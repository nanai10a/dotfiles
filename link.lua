-- import libraries

local lfs = require("lfs")

-- declare utilities

-- name: Execute and returns Void
local ev = function (cmd)
    os.execute(cmd)
end

-- name: Execute and returns Output
-- from: https://stackoverflow.com/a/326715
local eo = function (cmd)
  local f = assert(io.popen(cmd, 'r'))
  local s = assert(f:read('*a'))
  f:close()

  s = string.gsub(s, '^%s+', '')
  s = string.gsub(s, '%s+$', '')
  s = string.gsub(s, '[\n\r]+', ' ')

  return s
end

-- name: LiNk Hardly
local lnh = function (from, to) lfs.link(from, to) end

-- name: LiNk Symbolically
local lns = function (from, to) lfs.link(from, to, true) end

local is_root = eo("whoami") == "root"
local pwd = lfs.currentdir()
local config_dir = os.getenv("XDG_CONFIG_HOME")

-- main program

lns(pwd .. "/dot_config/nvim", config_dir .. "/nvim")
lns(pwd .. "/dot_config/zsh", config_dir .. "/zsh")

if (is_root) then
    lnh(pwd .. "/root/etc/zsh/zshenv", "/etc/zsh/zshenv")
end
