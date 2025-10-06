-- ~/.config/nvim/lua/plugins/colorscheme-ayu.lua
return {
  {
    "Shatur/neovim-ayu",
    lazy = false,
    priority = 1000,
    config = function()
      require("ayu").setup({
        mirage = false, -- false = dark variant
        overrides = {
          Normal = { bg = "#000000" },
          NormalNC = { bg = "#000000" },
          NormalFloat = { bg = "#000000" },
          FloatBorder = { bg = "#000000" },
          SignColumn = { bg = "#000000" },
          VertSplit = { bg = "#000000" },
          StatusLine = { bg = "#000000" },
          TabLineFill = { bg = "#000000" },
          LineNr = { bg = "#000000" },
          CursorLineNr = { bg = "#000000" },
        },
      })
      vim.cmd.colorscheme("ayu")
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "ayu" },
  },
}
