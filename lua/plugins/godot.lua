-- GDScript support + Godot's built-in language server + "Godot as external editor" bridge.
-- Godot ships its own LSP inside the editor (TCP, default port 6005) -- there is nothing to
-- install via Mason, nvim just needs to connect to it while the Godot editor is open.
-- nvim-lspconfig already ships a correct native config at lsp/gdscript.lua (cmd, filetypes,
-- root_markers), so `gdscript = {}` below just enables it -- no need to redefine cmd/root_dir.

-- Lets Godot's "external editor -> jump to file:line" hand off to THIS nvim instance.
-- Only started when nvim is opened at the root of a Godot project, so a non-Godot nvim session
-- never steals the socket. If nvim crashes without cleaning up, the stale socket file blocks the
-- next session from claiming it -- `rm /tmp/godot-nvim.pipe` fixes that.
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.filereadable(vim.fn.getcwd() .. "/project.godot") == 1 then
      pcall(vim.fn.serverstart, "/tmp/godot-nvim.pipe")
    end
  end,
})

return {
  { "nvim-treesitter/nvim-treesitter", opts = { ensure_installed = { "gdscript" } } },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gdscript = {},
      },
    },
  },
}
