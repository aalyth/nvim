return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local on_attach = function(client, bufnr)
      client.server_capabilities.semanticTokensProvider = nil
      local map = function(lhs, rhs, desc)
        vim.keymap.set("n", lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
      end
      map("gd",    vim.lsp.buf.definition,      "Go to definition")
      map("gD",    vim.lsp.buf.declaration,     "Go to declaration")
      map("gi",    vim.lsp.buf.implementation,  "Go to implementation")
      map("gr",    vim.lsp.buf.references,      "Go to references")
      map("K",     vim.lsp.buf.hover,           "Hover docs")
      map("<C-k>", vim.lsp.buf.signature_help,  "Signature help")
      map("grn",   vim.lsp.buf.rename,          "Rename symbol")
      map("ca",    vim.lsp.buf.code_action,     "Code action")
      map("cf",    function() require("conform").format({ bufnr = bufnr }) end, "Format")
      map("cd",    vim.diagnostic.open_float,   "Diagnostics float")
      map("[d",    vim.diagnostic.goto_prev,    "Prev diagnostic")
      map("]d",    vim.diagnostic.goto_next,    "Next diagnostic")
    end

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Store globals for use in lang-specific files
    _G.shared_on_attach = on_attach
    _G.shared_capabilities = capabilities

    -- Set global LSP defaults (nvim 0.11+ native API)
    -- mason-lspconfig's automatic_enable=true will call vim.lsp.enable() for installed servers
    vim.lsp.config("*", {
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end,
}
