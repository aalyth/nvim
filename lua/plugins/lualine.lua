return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "kyazdani42/nvim-web-devicons" },
  opts = {
    options = {
      icons_enabled = false,
      component_separators = { left = "|", right = "<" },
      section_separators = { left = "", right = "" },
    },
  },
}
