# Powerlevel10k instant prompt. Must stay at the top for fast startup.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ----------------------------
# Oh My Zsh
# ----------------------------
export ZSH="$HOME/.oh-my-zsh"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# ----------------------------
# Editor
# ----------------------------
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='code'
fi

# ----------------------------
# PATH
# ----------------------------
export PATH="$HOME/.local/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$PATH:$HOME/.spicetify"

# ----------------------------
# NVM (Node Version Manager)
# ----------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# ----------------------------
# Oh My Zsh theme (Powerlevel10k)
# ----------------------------
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# ----------------------------
# Aliases
# ----------------------------
alias zrc="nvim ~/.zshrc"
alias szrc="source ~/.zshrc"
alias grep='grep --color=auto'
alias conf="cd ~/.config"
alias ls='eza --icons --group-directories-first'
alias ll='eza -lh --icons --group-directories-first --git'
alias la='eza -a --icons --group-directories-first'
alias lt='eza --tree --icons'
alias nv="nvim"
alias dj="cd ~/dev/Django/"
alias ocs='nv ~/.config/opencode/opencode.json'
alias oc='opencode'

# ----------------------------
# API Keys
# ----------------------------
