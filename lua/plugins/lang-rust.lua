return {
  "mrcjkb/rustaceanvim",
  version = "^5",
  ft = { "rust" },
  config = function()
    local codelldb_path = vim.fn.stdpath("data") .. "/mason/bin/codelldb"

    vim.g.rustaceanvim = {
      tools = {},
      server = {
        on_attach = function(client, bufnr)
          _G.shared_on_attach(client, bufnr)
          local map = function(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
          end
          map("<leader>re", function() vim.cmd("RustLsp expandMacro") end, "Expand macro")
          map("<leader>rr", function() vim.cmd("RustLsp runnables") end,   "Runnables")
          map("<leader>rt", function() vim.cmd("RustLsp testables") end,   "Testables")
          map("<leader>rd", function() vim.cmd("RustLsp openDocs") end,    "Open docs.rs")
        end,
        capabilities = _G.shared_capabilities,
        default_settings = {
          ["rust-analyzer"] = {},
        },
      },
      dap = {
        adapter = {
          type = "server",
          port = "${port}",
          executable = {
            command = codelldb_path,
            args = { "--port", "${port}" },
          },
        },
      },
    }
  end,
}
