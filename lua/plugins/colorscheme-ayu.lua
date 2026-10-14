-- ~/.config/nvim/lua/plugins/colorscheme-ayu.lua

return {
  {
    "Shatur/neovim-ayu",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.ayucolor = "dark"

      require("ayu").setup({
        mirage = false,
      })

      local function apply_custom_highlights()
        local bg_none_groups = {
          "Normal",
          "NormalNC",
          "NormalFloat",
          "SignColumn",
          "EndOfBuffer",
          "StatusLine",
          "StatusLineNC",
          "TabLine",
          "TabLineFill",
          "TabLineSel",
          "NeoTreeNormal",
          "NeoTreeNormalNC",
        }

        for _, group in ipairs(bg_none_groups) do
          vim.api.nvim_set_hl(0, group, { bg = "NONE" })
        end

        -- Główny tekst
        vim.api.nvim_set_hl(0, "Normal", {
          fg = "#b8b6ad",
          bg = "NONE",
        })

        vim.api.nvim_set_hl(0, "NormalNC", {
          fg = "#9f9d95",
          bg = "NONE",
        })

        -- Separatory okien
        vim.api.nvim_set_hl(0, "WinSeparator", {
          fg = "#2a2f3a",
          bg = "NONE",
        })

        vim.api.nvim_set_hl(0, "VertSplit", {
          fg = "#2a2f3a",
          bg = "NONE",
        })

        -- Obwódki popupów / floatów
        vim.api.nvim_set_hl(0, "FloatBorder", {
          fg = "#2f3642",
          bg = "NONE",
        })

        vim.api.nvim_set_hl(0, "NormalFloat", {
          fg = "#b8b6ad",
          bg = "NONE",
        })

        -- Numery linii
        vim.api.nvim_set_hl(0, "LineNr", {
          fg = "#3c4354",
          bg = "NONE",
        })

        vim.api.nvim_set_hl(0, "CursorLineNr", {
          fg = "#7a8294",
          bg = "NONE",
        })

        -- Cursor line
        vim.api.nvim_set_hl(0, "CursorLine", {
          bg = "NONE",
        })

        -- Indent guides, jeżeli używasz indent-blankline / ibl
        vim.api.nvim_set_hl(0, "IblIndent", {
          fg = "#1e222a",
        })

        vim.api.nvim_set_hl(0, "IblScope", {
          fg = "#303744",
        })

        -- Status line
        vim.api.nvim_set_hl(0, "StatusLine", {
          fg = "#9fa6b2",
          bg = "NONE",
        })

        vim.api.nvim_set_hl(0, "StatusLineNC", {
          fg = "#555d6d",
          bg = "NONE",
        })
      end

      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = apply_custom_highlights,
      })

      vim.cmd.colorscheme("ayu")
      apply_custom_highlights()
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "ayu",
    },
  },
}
