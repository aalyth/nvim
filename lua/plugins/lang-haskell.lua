return {
  "mrcjkb/haskell-tools.nvim",
  version = "^4",
  ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
  config = function()
    vim.g.haskell_tools = {
      hls = {
        on_attach = function(client, bufnr)
          _G.shared_on_attach(client, bufnr)
          local map = function(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
          end
          map("<leader>he", function() require("haskell-tools").lsp.buf_eval_all() end, "Eval all")
          map("<leader>hr", require("haskell-tools").repl.toggle,                        "Toggle REPL")
          map("<leader>hq", require("haskell-tools").repl.quit,                          "Quit REPL")
        end,
        capabilities = _G.shared_capabilities,
      },
    }
  end,
}
