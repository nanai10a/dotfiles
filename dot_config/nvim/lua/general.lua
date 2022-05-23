vim.o.clipboard = "unnamedplus" .. "," .. vim.o.clipboard
vim.o.expandtab = true
vim.o.list = true
vim.o.equalalways = false

vim.g.loaded_perl_provider = 0

vim.o.showmode = false

vim.cmd("language en_US.utf8")

vim.cmd("command! Reload so $MYVIMRC")

local nnoremap = function(from, to)
    vim.api.nvim_set_keymap("n", from, to, { noremap = true })
end

local inoremap = function(from, to)
    vim.api.nvim_set_keymap("i", from, to, { noremap = true })
end

-- disable: arrow keys
nnoremap("<down>", "")
nnoremap("<up>", "")
nnoremap("<left>", "")
nnoremap("<right>", "")

inoremap("<down>", "")
inoremap("<up>", "")
inoremap("<left>", "")
inoremap("<right>", "")

-- disable: unnecessary keys
nnoremap("o", "")
nnoremap("O", "")
nnoremap("s", "")
nnoremap("S", "")
nnoremap("r", "")
nnoremap("R", "")

-- map: move window
nnoremap("sj", "<c-w>j")
nnoremap("sk", "<c-w>k")
nnoremap("sh", "<c-w>h")
nnoremap("sl", "<c-w>l")

-- map: close window
nnoremap("sc", "<c-w>c")
nnoremap("sr", "<c-w>r")

-- map: relayout window
nnoremap("<a-j>", "<c-w>J")
nnoremap("<a-k>", "<c-w>K")
nnoremap("<a-h>", "<c-w>H")
nnoremap("<a-l>", "<c-w>L")

-- map: create window
nnoremap("sJ", "<cmd>botright new<cr>")
nnoremap("sK", "<cmd>new<cr>")
nnoremap("sH", "<cmd>vnew<cr>")
nnoremap("sL", "<cmd>rightbelow vnew<cr>")

-- map: create and relayout tab
nnoremap("<c-w>j", "<cmd>tabnew<cr>")
nnoremap("<c-w>k", "<cmd>tabnew<cr><cmd>tabmove -1<cr>")
nnoremap("<c-w>h", "<cmd>tabmove -1<cr>")
nnoremap("<c-w>l", "<cmd>tabmove +1<cr>")

-- map: close and rewind and switch tab
nnoremap("<c-w>c", "<cmd>tabc<cr>")
nnoremap("<c-w>r", "<cmd>tabrewind<cr>")
nnoremap("<c-w>s", "<cmd>tabnext<cr>")

-- disable: unnecessary keys
nnoremap("J", "")
nnoremap("q", "")
nnoremap("Q", "")
