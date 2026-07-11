# dotfiles

Личный бэкап конфигов для двух систем:

- **`MACOS/`** — macOS (zsh, AeroSpace, Ghostty, sketchybar, Neovim, Zed, Doom Emacs и т.д.)
- **`config/` + `zsh/`** (в корне) — Linux/[Omarchy](https://omarchy.org) (Hyprland, Waybar, Neovim, Zed и т.д.)

Это не symlink-фермa (chezmoi/stow не используются) — файлы просто скопированы. Значит после
правки живого конфига его нужно руками скопировать обратно сюда (см. «Обновление бэкапа» ниже).

---

## Настройка на новом Mac

1. **Homebrew**, если его ещё нет:
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. **Клонировать репозиторий**:
   ```bash
   git clone https://github.com/djoni1vincent/dotfiles.git ~/djoni/dotfiles
   cd ~/djoni/dotfiles
   ```

3. **Пакеты и приложения** из `MACOS/Brewfile` (формулы + касты):
   ```bash
   brew bundle install --file=MACOS/Brewfile
   ```

4. **Oh My Zsh + Powerlevel10k + плагины** (в конфиге на них ссылки, но сами они не входят
   в репозиторий — это внешние тулы):
   ```bash
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
   git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
   git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
   git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
   ```

5. **Разложить домашние дотфайлы**:
   ```bash
   cp MACOS/.zshrc MACOS/.zprofile MACOS/.p10k.zsh MACOS/.aerospace.toml MACOS/.gitconfig ~/
   ```

6. **Разложить `~/.config`**:
   ```bash
   for d in starship.toml borders ghostty git linearmouse spicetify sketchybar nvim doom zed; do
     cp -R "MACOS/config/$d" ~/.config/
   done
   ```
   `~/.config/starship.toml` копируется как файл, остальное — как директории.

7. **SSH**: приватный ключ в репозитории **не хранится**. На новой машине сгенерируй новый
   ключ (`ssh-keygen -t ed25519`) и добавь публичный на GitHub/сервера. `MACOS/ssh/id_ed25519.pub`
   и `known_hosts` — просто справочные копии, для восстановления доверенных хостов можно взять
   `known_hosts` как основу.

8. **Приложения не из Brewfile**: AeroSpace, sketchybar, borders, Ghostty обычно уже покрыты
   Brewfile — если нет, доставь через `brew install --cask <app>`.

---

## Настройка на новой Linux-машине (Omarchy)

Эта часть репозитория — не самодостаточная установка, а оверлей поверх готового Omarchy.

1. Установи Omarchy по официальной инструкции с omarchy.org (базовый Hyprland/Arch-стек,
   Neovim, zsh с oh-my-zsh уже будут внутри).
2. Клонируй репозиторий и разложи поверх:
   ```bash
   git clone https://github.com/djoni1vincent/dotfiles.git ~/dotfiles
   cp -R ~/dotfiles/config/. ~/.config/
   cp ~/dotfiles/zsh/.zshrc ~/dotfiles/zsh/.p10k.zsh ~/
   ```
3. Недостающие пакеты (kitty, lazydocker, lazygit, btop, fastfetch, tmux, gh, ruff и т.д.)
   ставь через `yay`/`pacman` по мере необходимости — конкретной команды-инсталлятора под них
   в репозитории нет.

---

## Секреты (специально не в репозитории)

Репозиторий публичный, поэтому эти вещи **не** попадают сюда и их нужно вручную восстановить
на новой машине:

| Что | Где было | Как восстановить |
|---|---|---|
| `CONTEXT7_API_KEY` | было захардкожено в `.zshrc` | сгенерировать новый ключ и экспортировать его в отдельном локальном файле, например `~/.config/zsh/secrets.zsh`, и добавить `source` этого файла в `.zshrc` |
| GitHub PAT для Zed MCP (`mcp-server-github`) | `~/.config/zed/settings.json` → `context_servers.mcp-server-github.settings.github_personal_access_token` | создать новый токен на github.com/settings/tokens и вписать локально в `settings.json` (не коммитить) |
| SSH приватный ключ | `~/.ssh/id_ed25519` | сгенерировать новый на месте, публичный ключ добавить туда, где нужен доступ |

---

## Обновление бэкапа

Симлинков нет, так что после изменения любого конфига на живой системе — скопируй файл обратно
в репозиторий тем же путём, каким он оттуда разложен (см. таблицы выше), и закоммить.
