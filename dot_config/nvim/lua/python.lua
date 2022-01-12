local install = function(mod)
    os.execute("pip3 install --user " .. mod .. " &> /dev/null &")
end

if vim.fn.has("python3") ~= 1 then
    install("pynvim")
    install("send2trash")
    install("ueberzug")
end
