-- Compile the current C/C++ file with debug symbols and launch it in codelldb,
-- so there's no need to type the executable path by hand.

local function compile_current_file()
  vim.cmd("silent write")
  local src = vim.fn.expand("%:p")
  local out = vim.fn.expand("%:p:r")
  local compiler = vim.bo.filetype == "c" and "gcc" or "g++"
  local res = vim.system({ compiler, "-g", "-O0", "-Wall", src, "-o", out }):wait()
  if res.code ~= 0 then
    vim.notify(res.stderr, vim.log.levels.ERROR, { title = "Compilation failed" })
    return require("dap").ABORT
  end
  return out
end

local compile_and_debug = {
  type = "codelldb",
  request = "launch",
  name = "Compile & debug current file",
  program = compile_current_file,
  cwd = "${fileDirname}",
}

return {
  {
    "mfussenegger/nvim-dap",
    keys = {
      {
        "<leader>dd",
        function()
          require("dap").run(compile_and_debug)
        end,
        desc = "Compile & Debug File",
        ft = { "c", "cpp" },
      },
    },
    opts = function()
      local dap = require("dap")
      for _, lang in ipairs({ "c", "cpp" }) do
        dap.configurations[lang] = dap.configurations[lang] or {}
        table.insert(dap.configurations[lang], 1, compile_and_debug)
      end
    end,
  },
}
