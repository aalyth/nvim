vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.clipboard = "unnamedplus"
vim.opt.expandtab = true
vim.opt.colorcolumn = "80,100"
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 300
vim.opt.termguicolors = true

vim.diagnostic.config({
  virtual_text = true,
  severity_sort = true,
  float = { border = "rounded", source = "always" },
})

-- Bordered hover and signature help (mimics CoC floating windows)
vim.lsp.handlers["textDocument/hover"] =
  vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
vim.lsp.handlers["textDocument/signatureHelp"] =
  vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
