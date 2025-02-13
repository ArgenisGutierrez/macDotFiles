# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export TERM="xterm-256color"
# Silenciar beep en Zsh
setopt no_beep           # Desactiva los pitidos en general
setopt no_hist_beep      # Silencia el beep al usar el historial
setopt no_list_beep      # Silencia el beep en autocompletado

# FZF
source <(fzf --zsh)

# Alias
alias la="eza -la"
alias ls="eza"
alias vim="nvim"

# Autosuggestion
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Syntax highlight
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#Zoxide
alias cd="z"
eval "$(zoxide init zsh)"

# atuin
eval "$(atuin init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
source /usr/local/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Yazi
export EDITOR="nvim"
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
