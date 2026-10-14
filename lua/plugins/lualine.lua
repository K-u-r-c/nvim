-- ~/.config/nvim/lua/plugins/lualine.lua

return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options = opts.options or {}

      opts.options.theme = {
        normal = {
          a = { fg = "#7aa2f7", bg = "NONE", gui = "bold" },
          b = { fg = "#9fa6b2", bg = "NONE" },
          c = { fg = "#6f7787", bg = "NONE" },
        },
        insert = {
          a = { fg = "#98c379", bg = "NONE", gui = "bold" },
          b = { fg = "#9fa6b2", bg = "NONE" },
          c = { fg = "#6f7787", bg = "NONE" },
        },
        visual = {
          a = { fg = "#c678dd", bg = "NONE", gui = "bold" },
          b = { fg = "#9fa6b2", bg = "NONE" },
          c = { fg = "#6f7787", bg = "NONE" },
        },
        replace = {
          a = { fg = "#e06c75", bg = "NONE", gui = "bold" },
          b = { fg = "#9fa6b2", bg = "NONE" },
          c = { fg = "#6f7787", bg = "NONE" },
        },
        command = {
          a = { fg = "#e5c07b", bg = "NONE", gui = "bold" },
          b = { fg = "#9fa6b2", bg = "NONE" },
          c = { fg = "#6f7787", bg = "NONE" },
        },
        inactive = {
          a = { fg = "#555d6d", bg = "NONE" },
          b = { fg = "#555d6d", bg = "NONE" },
          c = { fg = "#555d6d", bg = "NONE" },
        },
      }

      opts.options.section_separators = ""
      opts.options.component_separators = ""

      return opts
    end,
  },
}
