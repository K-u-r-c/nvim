# nvim

Mój **Neovim** na [LazyVim](https://github.com/LazyVim/LazyVim) z motywem ayu i własnym dashboardem. Ma gotowe środowisko do:

- **Python, C/C++ (clangd + CMake), Rust, TS/JS (eslint, prettier), C#/.NET, SQL, JSON/YAML/TOML, Docker, Markdown**,
- **debugowania** (DAP): `dap-cpp.lua` kompiluje bieżący plik C/C++ z `-g` i od razu odpala go w codelldb,
- **testów** (neotest), inc-rename, mini-surround, treesitter-context, gitui,
- **Godota**: LSP GDScriptu z edytora Godota (port 6005), a Godot może otwierać pliki w tym nvimie jako zewnętrzny edytor,
- Markdowna bez diagnostyk i sprawdzania pisowni.

> Część zestawu **[linux-tools](https://github.com/K-u-r-c/linux-tools)**. Najlepiej działa w [alacritty](https://github.com/K-u-r-c/alacritty) + [tmux](https://github.com/K-u-r-c/tmux).

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
| `lua/plugins/` | moje pluginy i nadpisania: motyw, lualine, dashboard, Godot, DAP dla C/C++, SQL, cichy Markdown |
