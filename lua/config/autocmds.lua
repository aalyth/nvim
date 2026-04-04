local autocmd = vim.api.nvim_create_autocmd

autocmd("FileType", {
  pattern = { "javascript", "typescript", "javascriptreact", "typescriptreact", "html", "css", "sass", "scss", "json" },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
  end,
})

autocmd("FileType", {
  pattern = { "text", "lua", "vim", "cpp", "antlr4" },
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
  end,
})

autocmd("FileType", {
  pattern = { "c", "go" },
  callback = function()
    vim.opt_local.shiftwidth = 8
    vim.opt_local.softtabstop = 8
  end,
})
