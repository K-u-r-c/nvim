-- Notebooki Jupytera (.ipynb) w Neovimie: mój fork https://github.com/K-u-r-c/jupynvim
-- (gałąź html-markdown) oryginału https://github.com/sheng-tse/jupynvim.
-- Komórki z ramkami, prawdziwy kernel, LSP (basedpyright/ruff z extras.lang.python) w komórkach,
-- wykresy jako obrazki – wymaga Ghostty 1.3+ albo kitty (w tmuxie: allow-passthrough on).
-- Fork dodaje HTML w komórkach markdown (banery, tabelki, kolory) i obrazki z plików (<img>, ![](plik)).
--
-- Kernel: jupyter kernelspec "python3" -> ~/.local/share/jupyter-venv (ipykernel, numpy, pandas, matplotlib).
-- Projekt z własnym .venv (z ipykernel) jest używany automatycznie (auto_venv).
-- Skróty (tylko w .ipynb): Shift+Enter uruchom i dalej, Ctrl+Enter uruchom i zostań,
-- <leader>nb/na nowa komórka, <leader>nm/ny markdown/kod, <leader>nK wybór kernela.
-- Diagnostyka: :checkhealth jupynvim
--
-- Jeśli jest lokalny klon forka w ~/Projects/jupynvim (do rozwijania łatki), lazy bierze go stamtąd;
-- inaczej klonuje fork z GitHuba. Binarkę backendu (v0.4.6) instalator i tak pobiera z oryginału.
local dev = vim.fn.expand("~/Projects/jupynvim")
local has_dev = vim.uv.fs_stat(dev .. "/lua/jupynvim/notebook/html.lua") ~= nil

return {
  "K-u-r-c/jupynvim",
  branch = "html-markdown",
  dir = has_dev and dev or nil,
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
