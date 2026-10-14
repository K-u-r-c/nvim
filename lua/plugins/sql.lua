-- sqlfluff fixes on top of LazyVim's lang.sql extra.
-- The dialect comes from sqlfluff config: ~/.config/sqlfluff/.sqlfluff (global default),
-- overridden by a .sqlfluff / pyproject.toml / setup.cfg in the project.
return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        sqlfluff = {
          -- LazyVim hardcodes --dialect=ansi, which would override a project's dialect
          args = { "format", "-" },
          -- conform's default only formats when a sqlfluff config is found in the project
          require_cwd = false,
        },
      },
    },
  },
}
