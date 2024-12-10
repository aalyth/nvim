
vim.g.mapleader = ' '
vim.keymap.set("n", "<leader>e", "<C-w>s<C-w>j:term<ENTER><C-w>7_<C-w>k")
vim.keymap.set("n", "<leader>v", "<C-w>v<C-w>l:term<ENTER><C-w>5<<C-w>h")

-- CoC
vim.keymap.set("n", "gd", "<Plug>(coc-definition)", {silent = true})
vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", {silent = true})
vim.keymap.set("n", "gr", "<Plug>(coc-references)", {silent = true})

vim.cmd([[
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
]])
vim.keymap.set("n", "K", ":call ShowDocumentation()<CR>", {silent = true})

vim.keymap.set("n", "rn", "<Plug>(coc-rename)", {silent = true})

-- CoC manage floating windows/popups with <C-j> and <C-k>
local opts = {silent = true, nowait = true, expr = true}
vim.keymap.set("n", "<C-j>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
vim.keymap.set("n", "<C-k>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
vim.keymap.set("i", "<C-j>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
vim.keymap.set("i", "<C-k>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)
vim.keymap.set("v", "<C-j>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
vim.keymap.set("v", "<C-k>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)

vim.keymap.set('n', 'ff', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', 'fg', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', 'fb', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', 'fh', '<cmd>Telescope help_tags<cr>')
