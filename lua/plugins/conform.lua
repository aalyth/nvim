return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  opts = {
    formatters_by_ft = {
      c          = { "clang_format" },
      cpp        = { "clang_format" },
      rust       = { "rustfmt" },
      go         = { "gofumpt", "goimports" },
      java       = { "google-java-format" },
      haskell    = { "ormolu" },
      erlang     = { "erlfmt" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      json       = { "prettier" },
      html       = { "prettier" },
      css        = { "prettier" },
      python     = { "black" },
    },
    format_on_save = {
      timeout_ms = 1000,
      lsp_fallback = true,
    },
  },
}
