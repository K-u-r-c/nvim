-- File: lua/plugins/snacks_dashboard.lua
return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        enabled = true,
        preset = {
          header = [[
██╗  ██╗██╗   ██╗██████╗  ██████╗    ██╗   ██╗██╗███╗   ███╗
██║ ██╔╝██║   ██║██╔══██╗██╔════╝    ██║   ██║██║████╗ ████║
█████╔╝ ██║   ██║██████╔╝██║         ██║   ██║██║██╔████╔██║
██╔═██╗ ██║   ██║██╔══██╗██║         ╚██╗ ██╔╝██║██║╚██╔╝██║
██║  ██╗╚██████╔╝██║  ██║╚██████╗     ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝ ╚═════╝      ╚═══╝  ╚═╝╚═╝     ╚═╝
          ]],
        },
      },
    },
    init = function()
      -- Optional: choose any color you like, here neon green
      vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = "#00FF7F" })
    end,
  },
}
