local map = vim.keymap.set

-- Exit terminal mode
map("t", "<Esc>", "<C-\\><C-n>")

-- Terminal splits
map("n", "<leader>e", "<C-w>s<C-w>j:term<CR><C-w>7_<C-w>k")
map("n", "<leader>v", "<C-w>v<C-w>l:term<CR><C-w>5<<C-w>h")
map("n", "<leader>s", "<C-w>s<C-w>j:term<CR><C-w>k")

-- Window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")
