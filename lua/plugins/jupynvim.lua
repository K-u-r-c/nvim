-- Notebooki Jupytera (.ipynb) w Neovimie: https://github.com/sheng-tse/jupynvim
-- Komórki z ramkami, prawdziwy kernel, LSP (basedpyright/ruff z extras.lang.python) w komórkach,
-- wykresy jako obrazki – wymaga Ghostty 1.3+ albo kitty (w tmuxie: allow-passthrough on).
--
-- Kernel: jupyter kernelspec "python3" -> ~/.local/share/jupyter-venv (ipykernel, numpy, pandas, matplotlib).
-- Projekt z własnym .venv (z ipykernel) jest używany automatycznie (auto_venv).
-- Skróty (tylko w .ipynb): Shift+Enter uruchom i dalej, Ctrl+Enter uruchom i zostań,
-- <leader>nb/na nowa komórka, <leader>nm/ny markdown/kod, <leader>nK wybór kernela.
-- Diagnostyka: :checkhealth jupynvim
return {
  "sheng-tse/jupynvim",
  version = "*", -- tylko stabilne wydania: binarka backendu jest dobierana do wersji pluginu
  lazy = false, -- musi być załadowany, zanim otworzysz .ipynb (przejmuje jego odczyt i zapis)
  build = function(plugin)
    local install = loadfile(plugin.dir .. "/lua/jupynvim/install.lua")()
    install.run(plugin)
  end,
  opts = {
    image_renderer = "placeholder",
  },
  config = function(_, opts)
    require("jupynvim").setup(opts)
  end,
}
