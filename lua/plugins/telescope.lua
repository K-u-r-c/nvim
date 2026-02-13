-- lua/plugins/telescope.lua
return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    defaults = {
      hidden = true,
    },
    pickers = {
      find_files = {
        no_ignore = true,
      },
    },
  },
}
