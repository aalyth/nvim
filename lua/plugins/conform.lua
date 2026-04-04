return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  opts = {
    formatters_by_ft = {
      c          = { "clang_format" },
      cpp        = { "clang_format" },
      rust       = { "rustfmt" },
      go         = { "gofumpt", "goimports" },
      java       = { "eclipse_java_formatter" },
      haskell    = { "ormolu" },
      erlang     = { "erlfmt" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      json       = { "prettier" },
      html       = { "prettier" },
      css        = { "prettier" },
      python     = { "black" },
    },
    formatters = {
      clang_format = {
        prepend_args = { "--style=file" },
      },
      eclipse_java_formatter = {
        -- Set this to the path of your Eclipse/IntelliJ formatter XML
        env = { JAVA_FORMATTER_CONFIG = vim.fn.expand("~/.config/eclipse-formatter.xml") },
      },
    },
    format_on_save = {
      timeout_ms = 1000,
      lsp_fallback = true,
    },
  },
}
