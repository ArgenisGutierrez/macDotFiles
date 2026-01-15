# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ================== Configuraciones clave primero ==================
export TERM="xterm-256color"

# Configurar fpath (¡Actualizado para Apple Silicon!)
fpath=(
  /opt/homebrew/share/zsh/site-functions    # Homebrew (ARM/M1/M2)
  /usr/local/opt/docker-completion/share/zsh/site-functions  # Docker
  $fpath
)

# ================== Paths y variables ==================
export GOROOT="/usr/local/opt/go/libexec"
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin:$GOROOT/bin"
export PATH="$PATH:$HOME/.composer/vendor/bin"
export EDITOR="nvim"
export PATH="/Users/argeis/.bun/bin:$PATH"
export OLLAMA_HOST=0.0.0.0:11434

# ================== Configuraciones de Zsh ==================
setopt no_beep              # Silenciar beeps
setopt no_hist_beep         # Silenciar beeps en el historial
setopt no_list_beep         # Silenciar beeps en autocompletado
setopt auto_menu            # Mostrar menú automáticamente
setopt menu_complete        # Completar con primera opción al presionar Tab

# ================== Plugins (¡Orden crítico!) ==================
# 1. Autosuggestions (primero para evitar conflictos)
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# 2. Syntax highlighting (último plugin)
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ================== Completions ==================
autoload -Uz compinit && compinit -i
zmodload zsh/complist  # Cargar módulo para menú interactivo

# Estilos del menú de autocompletado
zstyle ':completion:*' menu select=2
zstyle ':completion:*' list-rows-first yes
zstyle ':completion:*' group-name ''

# ================== Bindkeys para navegación con Tab ==================
# Navegación estándar
bindkey '^I' expand-or-complete  # Tab normal para autocompletar

# Navegación dentro del menú
bindkey -M menuselect '^I' menu-complete         # Tab: avanzar en el menú
bindkey -M menuselect '^[[Z' reverse-menu-complete  # Shift+Tab: retroceder
bindkey -M menuselect '^M' accept-line           # Enter: seleccionar

# ================== Herramientas externas ==================
# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Zoxide
eval "$(zoxide init zsh)"
alias cd="z"

# NVM (carga lenta, al final)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Powerlevel10k
source /usr/local/share/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ================== Alias y funciones ==================
alias la="eza -lah"
alias ls="eza"
alias vim="nvim"

# Yazi
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}
