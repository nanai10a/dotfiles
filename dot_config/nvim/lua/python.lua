local lprint = function(s)
    print("[c:python] " .. s)
end

local install = function(mod)
    vim.fn["asyncrun#run"]("", {}, "pip3 install --user " .. mod)
end

if vim.g.loaded_python3_provider == 0 then
    lprint("python3 does not recognized.")
    lprint("spawn for installing to required modules with pip3...")

    install("pynvim")
    install("send2trash")
    install("ueberzug")
end
