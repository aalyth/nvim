
vim.g.mapleader = ' '
vim.keymap.set("n", "<leader>e", "<C-w>s<C-w>j:term<ENTER><C-w>10_<C-w>k")
vim.keymap.set("n", "<leader>v", "<C-w>v<C-w>l:term<ENTER><C-w>5<<C-w>h")

-- CoC GoTo
vim.keymap.set("n", "gd", "<Plug>(coc-definition)", {silent = true})
vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", {silent = true})
vim.keymap.set("n", "gr", "<Plug>(coc-references)", {silent = true})

-- CoC manage floating windows/popups with <C-j> and <C-k>
local opts = {silent = true, nowait = true, expr = true}
vim.keymap.set("n", "<C-j>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
vim.keymap.set("n", "<C-k>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
vim.keymap.set("i", "<C-j>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
vim.keymap.set("i", "<C-k>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)
vim.keymap.set("v", "<C-j>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
vim.keymap.set("v", "<C-k>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
