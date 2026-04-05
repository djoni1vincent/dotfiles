# === 1. Ускорение запуска (Powerlevel10k Instant Prompt) ===
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# === 2. Пути (PATH) ===
# Исправляем странную строку из твоего скрина и добавляем стандартные пути
export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH"
export PATH="$PATH:/home/djoni/.spicetify"

# === 3. Настройка Oh My Zsh ===
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Добавил zsh-autosuggestions, так как он был у тебя на скрине
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# === 4. Окружение и Редактор ===
export EDITOR="nvim"

# === 6. Полезные алиасы ===
# Твои старые
alias pytk='GDK_BACKEND=x11 python'

# Новые и удобные (из видео и классика)
alias zrc="nvim ~/.zshrc"
alias szrc="source ~/.zshrc"
alias grep='grep --color=auto'

alias ls='eza --icons --group-directories-first'
alias ll='eza -lh --icons --group-directories-first --git'
alias la='eza -a --icons --group-directories-first'
alias lt='eza --tree --icons'
alias nv="nvim"
alias gpush='cd ~/dotfiles && git add . && git commit -m "auto update" && git push origin master && cd -'

# === 7. Темы и кастомизация (должно быть в конце) ===
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# === 8. Автозапуск Fastfetch (только для Kitty) ===
if [ -z "$FASTFETCH_SHOWN" ] && [ "$TERM" = "xterm-kitty" ]; then
    export FASTFETCH_SHOWN=1
    fastfetch
fi


