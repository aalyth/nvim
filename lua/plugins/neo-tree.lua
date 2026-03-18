return {
  "preservim/nerdtree",
  lazy = false,
  keys = {
    { "<leader>ft", "<cmd>NERDTreeToggle<cr>",  desc = "Toggle file tree" },
    { "<leader>fe", "<cmd>NERDTreeFind<cr>",    desc = "Reveal current file" },
  },
  init = function()
    vim.g.NERDTreeShowHidden = 1
    vim.cmd([[
      autocmd VimEnter * NERDTree | wincmd p
      autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
    ]])
  end,
}
