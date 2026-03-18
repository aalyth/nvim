return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>",   desc = "Find files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>",    desc = "Live grep" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>",      desc = "Buffers" },
    { "<leader>fd", "<cmd>Telescope diagnostics<cr>",  desc = "Diagnostics" },
    { "<leader>fr", "<cmd>Telescope lsp_references<cr>",       desc = "LSP references" },
    { "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document symbols" },
  },
}
