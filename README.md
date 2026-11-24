# nvim

Mój **Neovim** na [LazyVim](https://github.com/LazyVim/LazyVim) z motywem ayu i własnym dashboardem. Ma gotowe środowisko do:

- **Python, C/C++ (clangd + CMake), Rust, TS/JS (eslint, prettier), C#/.NET, SQL, JSON/YAML/TOML, Docker, Markdown**,
- **debugowania** (DAP): `dap-cpp.lua` kompiluje bieżący plik C/C++ z `-g` i od razu odpala go w codelldb,
- **testów** (neotest), inc-rename, mini-surround, treesitter-context, gitui,
- **Godota**: LSP GDScriptu z edytora Godota (port 6005), a Godot może otwierać pliki w tym nvimie jako zewnętrzny edytor,
- Markdowna bez diagnostyk i sprawdzania pisowni,
- **notebooków Jupytera** (`.ipynb`) przez mój fork [jupynvim](https://github.com/K-u-r-c/jupynvim): komórki, prawdziwy kernel, LSP w komórkach, wykresy jako obrazki, a do tego HTML i obrazki z plików w komórkach markdown (patrz [niżej](#notebooki-jupytera)).

> Część zestawu **[linux-tools](https://github.com/K-u-r-c/linux-tools)**. Najlepiej działa w [ghostty](https://github.com/K-u-r-c/ghostty) (obrazki w notebookach) + [tmux](https://github.com/K-u-r-c/tmux).

## Instalacja

```bash
sudo pacman -S --needed neovim git gcc make unzip ripgrep fd lazygit gitui nodejs npm python ttf-meslo-nerd

[ -d ~/.config/nvim ] && mv ~/.config/nvim ~/.config/nvim.bak
git clone https://github.com/K-u-r-c/nvim ~/.config/nvim
nvim --headless "+Lazy! restore" +qa    # pluginy dokładnie w wersjach z lazy-lock.json
```

Serwery LSP i formattery (Mason) doinstalują się same przy pierwszym otwarciu pliku danego języka.

Aktualizacja: `git -C ~/.config/nvim pull`, potem w nvimie `:Lazy restore`.

## Struktura

| Ścieżka | Co |
|---|---|
| `lazyvim.json` | włączone LazyVim extras (języki, DAP, testy…) |
| `lazy-lock.json` | przypięte wersje pluginów |
| `lua/config/` | opcje, keymapy, autocmd |
| `lua/plugins/` | moje pluginy i nadpisania: motyw, lualine, dashboard, Godot, DAP dla C/C++, SQL, cichy Markdown, Jupyter |

## Notebooki Jupytera

`lua/plugins/jupynvim.lua` dodaje mój fork [K-u-r-c/jupynvim](https://github.com/K-u-r-c/jupynvim) (gałąź `html-markdown`, oparta na v0.4.6 oryginału [sheng-tse/jupynvim](https://github.com/sheng-tse/jupynvim)). Fork rysuje surowy HTML w komórkach markdown (banery z obrazkiem obok tekstu, tabelki, nagłówki, kolory ze `style=`) i pokazuje obrazki z plików (`<img src>`, `![](plik.png)`), nie zmieniając źródła komórki. Jeśli istnieje lokalny klon w `~/Projects/jupynvim`, lazy bierze plugin stamtąd. Przy instalacji pobiera się backend `jupynvim-core` z GitHub Releases oryginału, sprawdzany z `SHA256SUMS`. `.ipynb` otwierasz zwykłym `:e`, kernel startuje sam według metadanych notebooka.

Obrazki (wykresy) wymagają terminala z protokołem graficznym Kitty: Ghostty 1.3+ albo kitty. W tmuxie także `set -g allow-passthrough on` i `extended-keys` (dla Shift/Ctrl+Enter), oba są w moim [tmux](https://github.com/K-u-r-c/tmux). W Alacritty ustaw `image_renderer = "chafa"` (obrazki ze znaków, `pacman -S chafa`).

Kernel Pythona do notebooków bez własnego środowiska, jako domyślny `python3`:

```bash
uv venv ~/.local/share/jupyter-venv
uv pip install --python ~/.local/share/jupyter-venv/bin/python ipykernel "ipywidgets>=8,<9" numpy pandas matplotlib
~/.local/share/jupyter-venv/bin/python -m ipykernel install --user --name python3 --display-name "Python 3 (jupyter-venv)"
```

Projekt z własnym `.venv` jest używany automatycznie, jeśli ma `ipykernel` (`uv pip install ipykernel` w projekcie).

| Skrót (tylko w `.ipynb`) | Co |
|---|---|
| Shift+Enter / Ctrl+Enter | uruchom komórkę i przejdź dalej / uruchom i zostań |
| Enter / `i`, Esc | edycja komórki, powrót do trybu komórek (`j`/`k`, `dd`, `yy`, `p` na całych komórkach) |
| `<leader>nb` / `<leader>na` | nowa komórka pod / nad |
| `<leader>nm` / `<leader>ny` | zamiana na markdown / kod |
| `<leader>nR` | uruchom wszystkie |
| `<leader>nK`, `<leader>nx`, `<leader>ni` | wybór kernela, restart, przerwanie |

Diagnostyka: `:checkhealth jupynvim`.
