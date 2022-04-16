local lprint = function(s)
    print("[c:python] " .. s)
end

local install = function(mod)
    os.execute("pip3 install --user " .. mod .. " &> /dev/null &")
end

if vim.fn.has("python3") ~= 1 then
    lprint("python3 does not recognized.")
    lprint("starting to install requiring modules with pip3...")

    install("pynvim")
    install("send2trash")
    install("ueberzug")

    lprint("installed python3 modules.")
end
