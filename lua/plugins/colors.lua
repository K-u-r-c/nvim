-- File: lua/plugins/colors.lua
return {
  -- disable default colorscheme LazyVim uses
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = nil,
    },
  },

  -- force black background everywhere
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      transparent = false,
      on_highlights = function(hl, c)
        local black = "#000000"
        hl.Normal = { bg = black, fg = c.fg }
        hl.NormalNC = { bg = black, fg = c.fg }
        hl.NormalFloat = { bg = black, fg = c.fg }
        hl.FloatBorder = { bg = black, fg = c.fg }
        hl.SignColumn = { bg = black }
        hl.LineNr = { bg = black, fg = "#444444" }
        hl.EndOfBuffer = { bg = black, fg = black }
        hl.CursorLine = { bg = "#0a0a0a" }
        hl.StatusLine = { bg = "#000000", fg = c.fg }
        hl.TabLine = { bg = "#000000", fg = c.fg }
        hl.Pmenu = { bg = black, fg = c.fg }
        hl.PmenuSel = { bg = "#111111", fg = c.fg }
      end,
    },
  },
}
